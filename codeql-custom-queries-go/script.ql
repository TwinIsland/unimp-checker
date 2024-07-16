/**
 * @name Unimp Struct
 * @kind problem
 * @problem.severity warning
 * @id go/unimp-check
 */

import go

/**
 * Check if a selecting expr is source from struct.
 */
predicate isStructFieldAccess(SelectorExpr sel) { sel.getBase().getType() instanceof StructType }

/**
 * Predicate to get the name of the struct containing the accessed field.
 */
predicate structContainingField(SelectorExpr sel, string structName) {
  exists(StructType structType | structType = sel.getBase().getType().(StructType) |
    structName = structType.getName()
  )
}

/**
 * Predicate to get the name of the accessed field.
 */
predicate accessedFieldName(SelectorExpr sel, string fieldName) {
  fieldName = sel.getSelector().getName()
}
// from SelectorExpr sel, string structName, string fieldName
// where
//   isStructFieldAccess(sel) and
//   structContainingField(sel, structName) and
//   accessedFieldName(sel, fieldName)
// select sel, structName, fieldName, "Accessed field: " + structName + "." + fieldName


from SelectorExpr sel
select sel.getBase().getType(), ""

