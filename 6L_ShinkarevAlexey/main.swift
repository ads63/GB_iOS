//
//  main.swift
//  6L_ShinkarevAlexey
//
//  Created by Алексей Шинкарев on 02.08.2021.
//

var a = Queue<String>(["q", "w", "e"])
let b = Queue<String>(a)
let c = Queue<String>()
let d = Queue<String>(b.asArray())
a[safe: 1] = "a"
a[safe: 11] = "ab"
var e = a[safe: 5]
e = a.peek()
e = a.pop()
a.push("qq")
a.push("ww")
var f = c.isEmpty()
f = a.isEmpty()
e = a.pop()
e = a.pop()
e = a.pop()
e = a.pop()
e = a.pop()
f = a.isEmpty()
print(a)
print(b)
print(c)
print(d)

var bb = b.filter { !$0.contains("q") }

print(b)
print(bb)
var bbb = b.prioritize { $1 > $0 }

print(bbb)
