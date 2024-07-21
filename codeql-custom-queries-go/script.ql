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


// predicate isKubernetesLibraryFunction(DataFlow::Node n) {
//   exists(ImportSpec i |
//     i.getPath().matches("%k8s.io%") and
//     n.getType(). = i.getACallable()
//   )
// }


module Config implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    source.asExpr() = getAStructLiteralValue(_) and
    not source.asExpr() instanceof StructLit
  }

  predicate isSink(DataFlow::Node n) {
    // We only discuss two cases here
    // 1. flow to specified build-in
    flowsToSpecBuildin(n)
    // 2. flow to k8s library, i.e. not buildin nor declared function
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
