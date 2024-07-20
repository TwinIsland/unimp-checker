package main

import (
	"fmt"
)

type MyType struct {
	subtype MySubType
}

type MySubType struct {
	name string
	id   int
}

type MyType2 struct {
	id int
	t2_name string
	flag bool
}

type PtrStruct struct {
	id int
	type2_ptr *MyType2
}

func change_type2_name(src *PtrStruct) {
	src.type2_ptr.t2_name = "name2"
}

func main() {
	foo := MyType{subtype: MySubType{name: "myName", id: 1}}
	bar := foo.subtype.id

	t2 := MyType2 {id: 12}
	t3 := PtrStruct{type2_ptr: &MyType2{
		id: 2,
	}}

	change_type2_name(&t3)

	c := "asdasd"
	id := "id"
	id = "id2"

	fmt.Println(t3.type2_ptr.id)

	_ = c
	_ = bar
	_ = t2
	_ = t3
	_ = id
}