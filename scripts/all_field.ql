/**
 * @name All Field
 * @description find all struct fields
 * @id go/all-fields
 * @kind problem
 * @tags correctness
 * @precision middle
 * @problem.severity warning
 * @security-severity 6.0
 */

import go

class StructField extends FieldBase {
  StructTypeExpr parent;

  StructField() { exists(StructTypeExpr sall | sall.getAField() = this | parent = sall) }

  string direct_pp() {
    exists(DeclaredType dall |
      exists(StructType sall | sall = dall.getSpec().getTypeExpr().getType() |
        parent.getType() = sall and
        dall.getName() + "." + this.getChild(1) = result
      )
    )
  }

  string pp_ign_root() {
    exists(DeclaredType dall |
      exists(StructTypeExpr sall | sall.getType() = dall.getSpec().getTypeExpr().getType() |
        dall.getType() = this.getType() and
        this.getChild(1) + "." + sall.getAField().(StructField).pp_ign_root() = result
      )
    )
    or
    result = this.getChild(1).toString()
  }

  string pp() {
    exists(DeclaredType dall |
      exists(StructTypeExpr sall | sall.getType() = dall.getSpec().getTypeExpr().getType() |
        dall.getType() = this.getType() and
        direct_pp() + "." + sall.getAField().(StructField).pp_ign_root() = result
      )
    )
    or
    result = direct_pp()
  }
}

from StructField all
select all, all.pp()
