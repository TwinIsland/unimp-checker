// lib/library.go
package lib

import "fmt"

// MyType1 represents your struct
type MyType1 struct {
	Name       string
	ID         int
	Subtype    MyType2
	SubtypePtr *MyType2
}

// MyType2 represents a nested struct inside MyType1
type MyType2 struct {
	Category string
	Level    int
}

func Foo(c *MyType1) {
	c.SubtypePtr.Category = "hello"
}

func (c *MyType1) Init() {
	c.ID = 1
	c.SubtypePtr = &MyType2{
		Level: 12,
	}
}

func MyFunc(m MyType2) {
	fmt.Println("Name in MyType1:", m.Level)
}
