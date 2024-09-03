/**
 * @name Selection Expr
 * @description find all selecton expr
 * @id go/selection-expr
 * @kind problem
 * @tags correctness
 * @precision middle
 * @problem.severity warning
 * @security-severity 6.0
 */

import go

Type getBaseType(Type base) {
  if base instanceof PointerType
  then result = getBaseType(base.(PointerType).getBaseType())
  else
    if base instanceof SliceType
    then result = base.(SliceType).getElementType()
    else result = base
}

string getSelectorExprPath(SelectorExpr cur) {
  if cur.getBase() instanceof SelectorExpr
  then
    getSelectorExprPath(cur.getBase().(SelectorExpr)) + "." + cur.getSelector().getName() = result
  else cur.getSelector().getName() = result
}

string getSelectorTypePath(SelectorExpr cur) {
  if cur.getBase() instanceof SelectorExpr
  then
    getSelectorTypePath(cur.getBase().(SelectorExpr)) + "." +
      getBaseType(cur.getSelector().getType()).toString() = result
  else getBaseType(cur.getSelector().getType()).toString() = result
}

from SelectorExpr all
where
  not any(Function f).getName() = all.getSelector().getName() and
  not all.getBase().getType() instanceof InvalidType
select all,
  getBaseType(all.getBase().getType()).toString() + "." + getSelectorExprPath(all) + "|" +
    getBaseType(all.getBase().getType()).toString() + "." + getSelectorTypePath(all)
