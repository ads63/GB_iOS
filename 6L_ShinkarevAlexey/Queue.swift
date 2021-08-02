//
//  main.swift
//  GB_homeworks
//
//  Created by Алексей Шинкарев on 02.08.2021.
//

import Foundation

// 1. Реализовать свой тип коллекции «очередь» (queue) c использованием
// дженериков.
// 2. Добавить ему несколько методов высшего порядка, полезных для этой
// коллекции (пример: filter для массивов)
// 3. * Добавить свой subscript, который будет возвращать nil в случае обращения
// к несуществующему индексу.

struct Queue<T> {
    private var elements: [T]

    init() { self.elements = [] }

    init(_ queue: Queue<T>) { self.elements = queue.elements }

    init(_ array: [T]) {
        self.elements = array
    }

    /// добавление  элемента в конец очереди
    mutating func push(_ element: T) {
        elements.append(element)
    }

    /// извлечение  элемента в начале очереди
    mutating func pop() -> T? {
        return isEmpty() ? nil : elements.removeFirst()
    }

    ///  чтение  элемента  в начале  очереди  без извлечения
    func peek() -> T? {
        return self[safe: 0]
    }

    /// проверка очереди на пустоту
    func isEmpty() -> Bool {
        return elements.isEmpty
    }

    ///  очередь  в массив
    func asArray() -> [T] {
        return elements
    }

    /// создание очереди из  упорядоченных значений
    func prioritize(_ predicate: (T, T) -> Bool) -> Queue<T> {
        return Queue(elements.sorted(by: predicate))
    }

    /// создание очереди из  отфильтрованных значений
    func filter(_ predicate: (T) -> Bool) -> Queue<T> {
        return Queue(elements.filter(predicate))
    }

    subscript(safe index: Int) -> T? {
        get {
            return elements.indices.contains(index) ? elements[index] : nil
        }

        set(newValue) {
            if let newValue = newValue, elements.indices.contains(index) {
                elements[index] = newValue
            }
        }
    }
}
