/**
 * @name Stuct Checker
 * @kind problem
 * @problem.severity warning
 * @id go/example/struct-checker
 */

import go

Expr getAStructLiteralValue(StructLit e) {
  exists(Expr element | element = e.getAnElement() |
    if element instanceof KeyValueExpr
    then result = element.(KeyValueExpr).getValue()
    else result = element
  )
}

string describeStructLiteralValue(Expr e) {
  exists(Write w, Field f, DataFlow::Node base, DataFlow::Node value |
    w.writesField(base, f, value) and value.asExpr() = e
  |
    result = describeStructLiteralValue(base.asExpr()) + "." + f.getName()
    or
    result = f.getName()
  )
}

string longestStuctLiteralValueDescription(Expr e) {
  result = max(string s | s = describeStructLiteralValue(e) | s order by s.length())
}

module Blah implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node n) {
    n.asExpr() = getAStructLiteralValue(_) and not n.asExpr() instanceof StructLit
  }

  predicate isSink(DataFlow::Node n) { any() }
}

module Flow = DataFlow::Global<Blah>;

from Flow::PathNode source, Flow::PathNode sink
where
  Flow::flowPath(source, sink) and
  source != sink
select source, sink, longestStuctLiteralValueDescription(source.getNode().asExpr()), ""
