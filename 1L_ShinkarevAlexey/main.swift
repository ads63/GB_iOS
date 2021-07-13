//import Foundation

//
//  main.swift
//  GB_homeworks
//
//  Created by Алексей Шинкарев on 13.07.2021.
//

import Foundation

//  решение квадратного уравнения a * x * x + b * x +c =0
let a:Double = 1.11
let b:Double = 22.11
let c:Double = 1.22

if a.isEqual(to: 0) {
    print("уравнение не является квадратным")
} else {
    let d:Double = b * b - 4 * a * c
    if d.isLess(than: 0.0) {
        print("уравнение не имеет корней")
    } else if d.isEqual(to: 0.0) {
        print("корень уравнения",-b/(2.0*a))
    } else {
    print("корни уравнения",(-b+d.squareRoot())/(2*a),(-b-d.squareRoot())/(2*a) )
    }
}

// найти площадь, периметр, гипотенузу прямоугольного треугольника
let cat1:Double = 11.222
let cat2:Double = 222.11

if cat1.isLessThanOrEqualTo(0) || cat2.isLessThanOrEqualTo(0) {
   print("длины катетов могут быть только положительными")
} else {
    let  hypo:Double = (pow(cat1,2)+pow(cat2,2.0)).squareRoot()
    print("площадь треугольника", (cat1*cat2)/2.0)
    print("периметр треугольника", cat1+cat2+hypo)
    print("гипотенуза", hypo)
}

// пользователь вводит сумму вклада и годовой процент
// найти сумму вклада через 5 лет
let period=5
print("\n\nвведите сумму вклада")
let sum: String? = readLine()
print("введите годовой процент")
let percent: String? = readLine()

if let sum: Double = Double(sum!) {
    if let percent: Double = Double(percent!) {
        if sum.isLessThanOrEqualTo(0.0) || percent.isLessThanOrEqualTo(0.0) {
            print("допустимы только положительные значения суммы и процента")
        } else {
            print("сумма вклада через \(period) лет",sum * pow(1.0+percent/100.0,Double(period)))
        }
    } else { print("недопустимое значение процента", percent!)}
} else { print("недопустимое значение суммы вклада", sum!)}
