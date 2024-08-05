/**
 * @name Unimp Struct Checker V2
 * @description check if program exhaust every struct field
 * @id go/unimp-struct-v2
 * @kind path-problem
 * @tags correctness
 * @precision high
 * @problem.severity warning
 * @security-severity 6.0
 */

import go
import semmle.go.dataflow.TaintTracking
import DataFlow::PathGraph

private string describeStructLiteralValue(DataFlow::Node fieldNode) {
  exists(Write w, Field f, DataFlow::Node base, DataFlow::Node value |
    w.writesField(base, f, value) and value = fieldNode
  |
    result = describeStructLiteralValue(base) + "." + f.getName()
    or
    result = f.getName()
  )
}

class StructFieldNode extends DataFlow::Node {
  Expr parent;

  StructFieldNode() {
    exists(KeyValueExpr pair | this.asExpr() = pair.getValue() |
      exists(StructLit all | pair = all.getAnElement())
    )
  }

  private string describe_helper(Expr fieldNode) {
    exists(Write w, Field f, DataFlow::Node base, StructFieldNode value |
      w.writesField(base, f, value) and
      value.asExpr() = fieldNode
    |
      result = f.getName()
      or
      result = describe_helper(base.asExpr()) + "." + f.getName()
    )
  }

  string describe() { result = describe_helper(this.asExpr()) }
}

class K8sCallMethod extends Method {
  K8sCallMethod() { this.getQualifiedName().indexOf("k8s.io") >= 0 }

  string describe() { this.getName() = result }
}

class K8sArgumentNode extends DataFlow::Node {
  K8sArgumentNode() {
    this instanceof DataFlow::ArgumentNode and
    exists(DataFlow::CallExpr all | all.getTarget().toString() = any(K8sCallMethod a).describe() |
      this.(DataFlow::ArgumentNode).argumentOf(all, _)
    )
  }

  string describe() { result = "flow to " + this.(DataFlow::ArgumentNode).getCall().toString() }
}

class Config extends TaintTracking::Configuration {
  Config() { this = "'struct field detector" }

  override predicate isSource(DataFlow::Node source) {
    // we track each struct field
    source instanceof StructFieldNode
  }

  override predicate isSink(DataFlow::Node sink) {
    // not flow to a k8s library
    not sink instanceof K8sArgumentNode
  }

  override predicate isSanitizer(DataFlow::Node node, DataFlow::FlowState state) {
    // some special build in function which is too hard to track with, like DeepCopy
    node instanceof DataFlow::ArgumentNode and
    exists(CallExpr call |
      node.asExpr() = call.getAnArgument() and
      (
        call.getCalleeName() = "DeepCopy" or
        call.getCalleeName() = "append"
      )
    ) and
    state = "stop tracking"
  }
}

from DataFlow::PathNode source, DataFlow::PathNode sink, Config configuration
where configuration.hasFlowPath(source, sink)
select unique(DataFlow::Node all | all = sink.getNode() | sink), source, sink,
  "'" + sink.getNode().(StructFieldNode).describe() +
    "': struct defined but not flow to k8s library"
