/**
 * @name K8s Struct Field
 * @description find all struct field that flow into k8s call
 * @id go/k8s-struct-field
 * @kind problem
 * @tags correctness
 * @precision middle
 * @problem.severity warning
 * @security-severity 6.0
 */

import go

// import DataFlow::PathGraph
class K8sCallMethod extends Function {
  K8sCallMethod() { this.getQualifiedName().indexOf("lib") >= 0 } // change to k8s.io in production env

  string describe() { this.getName() = result }
}

/**
 * struct type as k8s library method argument
 */
class K8sArgumentNode extends DataFlow::Node {
  K8sArgumentNode() {
    exists(DataFlow::CallExpr all |
      all.getTarget().toString() = any(K8sCallMethod a).describe() and
      all.getAnArgument() = this.asExpr()
    )
  }

  string pp() { result = "flow to " + this.(DataFlow::ArgumentNode).getCall().toString() }
}

class StructAsK8sArg extends K8sArgumentNode {
  Expr structExpr;

  StructAsK8sArg() {
    exists(CallExpr c |
      c.getAnArgument() = this.asExpr() and
      (
        this.asExpr().getType() = any(DeclaredType dall).getType() and structExpr = this.asExpr()
        or
        // direct
        this.asExpr().getType().toString() = "PtrStruct" and
        structExpr = this.asExpr()
        or
        // method(&arg)
        this.asExpr() instanceof AddressExpr and
        this.asExpr().getType().(PointerType).getBaseType().toString() = "PtrStruct" and
        structExpr = this.asExpr().(AddressExpr).getOperand()
        or
        // method(*arg)
        this.asExpr() instanceof StarExpr and
        // WARNING: CANNOT use alone because CompositeType is winder than struct type
        this.asExpr().(StarExpr).getBase().getType().(PointerType).getBaseType() instanceof
          CompositeType and
        structExpr = this.asExpr().(StarExpr).getBase()
      )
    )
  }

  override Type getType() {
    // may have a lot of cases, add more later
    this.asExpr().(StarExpr).getBase().getType().(PointerType).getBaseType() = result
  }
  // predicate has_field(StructFieldNode target) {
  //   exists(DeclaredType dall | dall.getType() = this.getType() |
  //     exists(StructType sall | sall = dall.getSpec().getTypeExpr().getType() |
  //       sall.getOwnField(target.get_field().getName(), _) = target.get_field()
  //     )
  //   )
  // }
}

from StructAsK8sArg all
select all, all.getType().toString(), all.pp(), "k8s-struct-field"
