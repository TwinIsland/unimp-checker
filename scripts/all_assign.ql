/**
 * @name K8s Struct Field
 * @description find all struct assign
 * @id go/k8s-struct-field-assign
 * @kind problem
 * @tags correctness
 * @precision middle
 * @problem.severity warning
 * @security-severity 6.0
 */

 import go


 class StructAssignNode extends DataFlow::Node {
    Type type;
    StructAssignNode() {
        this.asExpr() = any(AssignStmt a).getLhs() or
        this.asExpr() = any(AssignStmt a).getRhs() and
        exists(DeclaredType dall |
            exists(StructTypeExpr sall | sall.getType() = dall.getSpec().getTypeExpr().getType() |
              dall.getType() = this.getType() and type = this.getType()
            )
          )
    }

    string pp() {
        result = type.getName()
    }
 }

 from StructAssignNode all
 select all, all.pp()