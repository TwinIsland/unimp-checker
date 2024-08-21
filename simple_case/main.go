package main

import (
	"fmt"
	"project/lib"
)

/*
MyType1.Subtype.Category and MyType1.Subtype.ID should be reported!!
*/

func main() {
	a := lib.MyType1{
		Name: "type1 name",
	}

	b := lib.MyType2{
		Level: 12,
	}

	a.Init()

	lib.MyFunc(b) // prunning
	fmt.Println(a)
}
