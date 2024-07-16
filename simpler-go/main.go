package main

type MyType struct {
	subtype MySubType
}

type MySubType struct {
	name string
	id   int
}

func main() {
	foo := MyType{subtype: MySubType{name: "myName", id: 1}}
	bar := foo.subtype.id
	c := "asdasd"
	_ = c
	_ = bar
}