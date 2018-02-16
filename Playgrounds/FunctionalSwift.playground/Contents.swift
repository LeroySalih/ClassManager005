//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let items = ["1", "2", "Three"]

let intItems:[Int] = items.flatMap { (item) -> Int? in
    return Int(item)
}

print(intItems)
