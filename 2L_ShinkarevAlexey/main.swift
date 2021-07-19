//
//  main.swift
//  GB_homeworks
//
//  Created by Алексей Шинкарев on 18.07.2021.
//

import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.
func isEven(number: Int) -> Bool { return number.isMultiple(of: 2) }

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isTripple(number: Int) -> Bool { return number.isMultiple(of: 3) }

// 3. Создать возрастающий массив из 100 чисел.
var intArray = [Int](0 ... 99)
print("\nrising array ", intArray, intArray.count)

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
intArray = intArray.filter { !isEven(number: $0) && isTripple(number: $0) }
print("\nfiltered rising array ", intArray, intArray.count)

// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
// Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func addFibo2Array(arrayFibo: [Int]) -> [Int] {
    var newArray = arrayFibo
    switch newArray.count {
    case 0:
        newArray.append(0)
    case 1:
        newArray.append(1)
    default:
        newArray.append(newArray.suffix(2).reduce(0,+))
    }
    return newArray
}

var fiboArray = [Int]()
for _ in 1 ... 50 { fiboArray = addFibo2Array(arrayFibo: fiboArray) }
print("\nfibonacci ", fiboArray, "\n", fiboArray.count)

// 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//        a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//        b. Пусть переменная p изначально равна двум — первому простому числу.
//        c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//        d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//        e. Повторять шаги c и d, пока возможно.

func getPrimes(count: Int) -> [Int] {
    let maxRange = Int.max
    var beginValue = 2
    let range = count*2 // грубая оценка диапазона, потенциально содержащего искомое количество простых чисел (поскольку все четные кроме 2 не являются простыми)
    var endValue = beginValue > maxRange-range ? maxRange : beginValue+range-1
    var results = [Int]()

    repeat {
        var p = 2
        var rangeResults = [Int](beginValue ... endValue)
        while (p*p) <= endValue {
            rangeResults.removeAll(where: { $0 >= (p*p) && $0.isMultiple(of: p) })
            p = (results+rangeResults).first(where: { $0 > p })!
        }
        results.append(contentsOf: rangeResults)
        beginValue = endValue+1
        endValue = beginValue > maxRange-range ? maxRange : beginValue+range-1
    } while count > results.count && endValue < maxRange

    return Array(results.prefix(upTo: count))
}

var primes = getPrimes(count: 100)
print("\nprimes ", primes, "\n", primes.count)
