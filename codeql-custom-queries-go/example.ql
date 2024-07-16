/**
 * @name Hello world
 * @kind problem
 * @problem.severity warning
 * @id go/example/hello-world
 */

import go

module MyFlowConfiguration implements DataFlow::ConfigSig {
  // predicate includeHiddenNodes() {
  //     "" = ""
  // }
  predicate isSource(DataFlow::Node source) { source.asExpr().(Ident).getName() = "foo" }

  // predicate isSource(DataFlow::Node n) {
  //     n.asExpr() = getAStructLiteralValue(_) and not n.asExpr() instanceof StructLit
  // }
  // predicate isSink(DataFlow::Node sink) {
  //   // sink.getType().getQualifiedName().toString().indexOf("k8s.io/api/core/v1.") >= 0
  //     any()
  // }
  // predicate isAdditionalFlowStep(DataFlow::Node node1, FlowState state1, DataFlow::Node node2, FlowState state2) {
  //     node2.(DataFlow::Read).readsField(node1, _) and
  //     state1 != "" and state2 = concat(string s | s = [state1, "1"] | s, ".")
  // }
  predicate isSink(DataFlow::Node sink) { any() }
}

module MyFlow = TaintTracking::Global<MyFlowConfiguration>;

// module MyFlowConfiguration2 implements DataFlow::ConfigSig {
//     predicate isSource(DataFlow::Node source) {
//         MyFlow::flowTo(source)
//     }
//     predicate isBarrierIn(DataFlow::Node node) {
//         MyFlow::flowTo(node)
//     }
//     predicate isSink(DataFlow::Node sink) {
//       // sink.getType().getQualifiedName().toString().indexOf("k8s.io/api/core/v1.") >= 0
//         any()
//     }
//     predicate isAdditionalFlowStep(DataFlow::Node node1, DataFlow::Node node2) {
//         any(DataFlow::Write w).writesComponent(node2.(DataFlow::PostUpdateNode).getPreUpdateNode(), node1)
//     }
// }
// module MyFlow2 = TaintTracking::Global<MyFlowConfiguration2>;
// import MyFlow::PathGraph
// from MyFlow::PathNode source, MyFlow::PathNode sink
// where MyFlow::flowPath(source, sink)
// and source != sink
// select source, sink, longestStuctLiteralValueDescription(source.getNode().asExpr())
class NotSink extends DataFlow::Node {
  NotSink() { not MyFlow::flowTo(this) }
}

query predicate edges(MyFlow::PathNode src, MyFlow::PathNode sink) {
  src.getNode().getASuccessor() = sink.getNode() or
  sink.getNode().(DataFlow::FieldReadNode).getBase() = src.getNode()
}

from MyFlow::PathNode src, MyFlow::PathNode sink
where
  MyFlow::flowPath(src, sink) and
  exists(NotSink n | sink.getNode().getASuccessor() = n)
select sink.getNode(), src, sink, "Path"
// from SsaWithFields ssaf
// select ssaf, ssaf.getBaseVariable(), ssaf.getAUse()
// from DataFlow::Node node
// where node.getFile().getBaseName() = "main.go"
// select node, node.getNodeKind()
