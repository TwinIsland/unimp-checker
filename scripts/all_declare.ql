/**
 * @name All Declare
 * @description find all declared struct fields
 * @id go/all-declare
 * @kind problem
 * @tags correctness
 * @precision middle
 * @problem.severity warning
 * @security-severity 6.0
 */

import go

Type getBaseType(Type base) {
  base = result
  or
  base instanceof PointerType and result = getBaseType(base.(PointerType).getBaseType())
}

string getSelectorExprPath(SelectorExpr cur) {
  if cur.getBase() instanceof SelectorExpr
  then
    getSelectorExprPath(cur.getBase().(SelectorExpr)) + "." + cur.getSelector().getName() = result
  else cur.getSelector().getName() = result
}

class StructFieldNode extends DataFlow::Node {
  StructLit inStruct;

  StructFieldNode() {
    exists(KeyValueExpr pair | this.asExpr() = pair.getValue() |
      exists(StructLit all | pair = all.getAnElement() and inStruct = all)
    )
  }

  StructFieldNode get_parent() {
    exists(Write w, Field f, DataFlow::Node base, DataFlow::Node value |
      w.writesField(base, f, value) and
      value = this
    |
      base instanceof StructFieldNode and base = result
    )
  }

  Field get_field() {
    exists(Write w, Field f, DataFlow::Node base, DataFlow::Node value |
      w.writesField(base, f, value) and
      value = this
    |
      f = result
    )
  }

  string pp() {
    this.get_parent().(StructFieldNode).pp() + "." + this.get_field().getName() = result
    or
    exists(DeclaredType dall |
      exists(StructType sall | sall = dall.getSpec().getTypeExpr().getType() |
        sall.getOwnField(this.get_field().getName(), _) = this.get_field()
      )
    |
      dall + "." + this.get_field().getName() = result
    )
  }

  string pp_ign_root() {
    this.get_parent().(StructFieldNode).pp() + "." + this.get_field().getName() = result
    or
    this.get_field().getName() = result
  }

  string complete_pp() {
    exists(Assignment asall |
      asall.getRhs() = inStruct
      or
      asall.getRhs() instanceof AddressExpr and
      asall.getRhs().(AddressExpr).getAnOperand() = inStruct and
      asall.getLhs() instanceof SelectorExpr
    |
    getSelectorExprPath(asall.getLhs().(SelectorExpr)) + "." + this.pp_ign_root() = result
    )
    or
    pp() = result
  }
}

// from StructFieldNode all
// select all, all.complete_pp()
from StructFieldNode all
select all, all.complete_pp()
