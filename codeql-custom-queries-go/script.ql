/**
 * @name Unimp Struct Checker
 * @description check if program exhaust every struct field
 * @id go/unimp-struct
 * @kind path-problem
 * @tags correctness
 * @precision high
 * @problem.severity warning
 * @security-severity 6.0
 */

/*
 *    expect report:
 *        MySubType.id; MyType2.flag; PtrStruct.id;
 *    on simple-db
 */

import go

// decompress nested struct, get unit value
Expr getUnitValue(Expr e) {
  if e instanceof KeyValueExpr
  then result = getUnitValue(e.(KeyValueExpr).getValue())
  else result = e
}

Expr getAStructLiteralValue(StructLit e) {
  exists(Expr element | element = e.getAnElement() | result = getUnitValue(element))
}

predicate flowsToSpecBuildin(DataFlow::Node n) {
  exists(CallExpr call |
    n.asExpr() = call.getAnArgument() and
    (
      call.getCalleeName() = "DeepCopy" or
      call.getCalleeName() = "Println"
    )
  )
}

predicate flowsToK8sLib(DataFlow::Node n) {
  exists(ImportSpec i | i.getPath().matches("%k8s.io%") |
    n.asExpr().(CallExpr).getTarget().getPackage().getPath() = i.getName()
  )
}

// class FieldBaseExtra extends FieldBase {
//   FieldBaseExtra() { this = this }
//   // hold if a data flow node belongs to such fieldbase.
//   FieldBaseExtra source_belong_to(DataFlow::Node n) {
//     exists(DataFlow::Path ap |
//       ap.getNode() = n and
//       ap.getFieldBase() = this
//     )
//   }
// }
module Config implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    source.asExpr() = getAStructLiteralValue(_) and
    not source.asExpr() instanceof StructLit
  }

  predicate isSink(DataFlow::Node n) {
    // We only discuss two cases here
    // 1. flow to specified build-in
    // any()
    // or
    flowsToSpecBuildin(n)
    or
    // 2. flow to k8s library, i.e. not buildin nor declared function
    flowsToK8sLib(n)
  }
}

module Flow = DataFlow::Global<Config>;

import Flow::PathGraph

from Flow::PathNode source, Flow::PathNode sink
where Flow::flowPath(source, sink) and source != sink
select sink.getNode(), source, sink, ""
// from ImportSpec i
// where i.getPath().matches("%k8s.io%")
// select i.getPath(), "k8s library function"
// from ImportSpec i
// where
//   i.getPath().matches("%k8s.io%")
// select i, "k8s library function"
// from Function c, DeclaredFunction d
// where c != d
// select d, d.getPackage().getPath()
// from CallExpr call
// select call, call.getType().getPackage()
// from ImportSpec i
// where
//   i.getPath().matches("%k8s.io%")
// from Flow::PathNode source, Flow::PathNode sink
// where Flow::flowPath(source, sink) and source != sink
// select sink.getNode(), source, sink, ""
// from CallExpr c
// where exists(ImportSpec i | i.getPathExpr() = c.getCalleeExpr())
// select c
// from ImportSpec i
// select i.getPathExpr()
// from CallExpr c
// select c.getCalleeName()
// from ImportSpec i
// where i.getPath().matches("%k8s.io%")
// select i.getNameExpr()
// from DataFlow::Node n
// where flowsToK8sLib(n)
// select n
// Predicate to identify if a function is declared in the current package
// from CallExpr call, Function fn, BuiltinFunction bfn
// where
//   bfn != fn and
//   call.getTarget() = fn and
//   not isDeclaredInCurrentPackage(fn)
// select call, fn, "This call expression originates from an external library."

// from DataFlow::Node n
// where exists(ImportSpec i | i.getName() =  n.asExpr().(CallExpr).getTarget().getPackage().getPath())
// select n

// from ImportSpec i
// select i.getName()

// from DataFlow::Node n
// where n.asExpr().(CallExpr).getTarget().getPackage().getPath() = "api"
// select n