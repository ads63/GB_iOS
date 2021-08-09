//
//  main.swift
//  7L_ShinkarevAlexey
//
//  Created by Алексей Шинкарев on 05.08.2021.
//

let users = ["iivanov":
    User(firstName: "И", lastName: "Иванов", password: "Pass___1"),
    "ppetrov":
        User(firstName: "П", lastName: "Петров", password: "Password")]

// class UserDictionary test cases
print("\n\nclass UserDictionary test cases")
// успешное добавление нового пользователя
var result: (User?, Error?)
var resultPass: (Bool, Error?)
result = UserDictionary.addUser("iivanov", users["iivanov"]!)
if let user = result.0 {
    print("Добавлен пользователь \(user)")
} else if let error = result.1 {
    print("Ошибка \(error.localizedDescription)")
}

// попытка добавить существующего пользователя
result = UserDictionary.addUser("iivanov", users["iivanov"]!)
if let user = result.0 {
    print("Добавлен пользователь \(user)")
} else if let error = result.1 {
    print("Ошибка \(error.localizedDescription)")
}

// попытка установить пароль, не отвечающий требованиям
resultPass = UserDictionary.setPassword("iivanov", "invalid pass")
if resultPass.0 {
    print("Пароль успешно изменен")
} else if let error = resultPass.1 {
    print("Ошибка \(error.localizedDescription)")
}

// успешное изменение пароля
resultPass = UserDictionary.setPassword("iivanov", "ValidPass1!")
if resultPass.0 {
    print("Пароль успешно изменен")
} else if let error = resultPass.1 {
    print("Ошибка \(error.localizedDescription)")
}

// удаление несуществующего пользователя
result = UserDictionary.removeUser("ppetrov")
if let user = result.0 {
    print("Удален пользователь \(user)")
} else if let error = result.1 {
    print("Ошибка \(error.localizedDescription)")
}

// успешное удаление пользователя
result = UserDictionary.removeUser("iivanov")
if let user = result.0 {
    print("Удален пользователь \(user)")
} else if let error = result.1 {
    print("Ошибка \(error.localizedDescription)")
}

// успешное добавление ранее удаленного пользователя
result = UserDictionary.addUser("iivanov", users["iivanov"]!)
if let user = result.0 {
    print("Добавлен пользователь \(user)")
} else if let error = result.1 {
    print("Ошибка \(error.localizedDescription)")
}

// class UserDictionaryWithThrows test cases
print("\n\nclass UserDictionaryWithThrows test cases")
// успешное добавление нового пользователя
do {
    let user = try UserDictionaryWithThrows.addUser("iivanov", users["iivanov"]!)
    print("Добавлен пользователь \(user!)")
} catch {
    print("Ошибка \(error.localizedDescription)")
}

// попытка добавить существующего пользователя
do {
    let user = try UserDictionaryWithThrows.addUser("iivanov", users["iivanov"]!)
    print("Добавлен пользователь \(user!)")
} catch {
    print("Ошибка \(error.localizedDescription)")
}

// попытка установить пароль, не отвечающий требованиям
do {
    try UserDictionaryWithThrows.setPassword("iivanov", "invalid pass")
    print("Пароль успешно изменен")
} catch {
    print("Ошибка \(error.localizedDescription)")
}

// успешное изменение пароля
do {
    try UserDictionaryWithThrows.setPassword("iivanov", "ValidPass1!")
    print("Пароль успешно изменен")
} catch {
    print("Ошибка \(error.localizedDescription)")
}

// удаление несуществующего пользователя
do {
    let user = try UserDictionaryWithThrows.removeUser("ppetrov")
    print("Удален пользователь \(user!)")
} catch {
    print("Ошибка \(error.localizedDescription)")
}

// успешное удаление пользователя
do {
    let user = try UserDictionaryWithThrows.removeUser("iivanov")
    print("Удален пользователь \(user!)")
} catch {
    print("Ошибка \(error.localizedDescription)")
}

// успешное добавление ранее удаленного пользователя
do {
    let user = try UserDictionaryWithThrows.addUser("iivanov", users["iivanov"]!)
    print("Добавлен пользователь \(user!)")
} catch {
    print("Ошибка \(error.localizedDescription)")
}
