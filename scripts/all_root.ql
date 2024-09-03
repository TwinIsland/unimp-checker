/**
 * @name All Root
 * @description find all root struct declaration
 * @id go/all-root
 * @kind problem
 * @tags correctness
 * @precision middle
 * @problem.severity warning
 * @security-severity 6.0
 */

import go

class StructDecl extends DeclaredType {
  StructDecl() { exists(StructType sall | sall = this.getSpec().getTypeExpr().getType()) }
}

class NestedStructDecl extends StructDecl {
  NestedStructDecl() {
    exists(FieldBase fb |
      exists(StructTypeExpr sall | sall.getAField() = fb | fb.getType() = this.getType())
    )
  }
}

from StructDecl all
where not all instanceof NestedStructDecl
select all, all.toString()
