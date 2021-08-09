//
//  UserDictionary.swift
//  7L_ShinkarevAlexey
//
//  Created by Алексей Шинкарев on 05.08.2021.
//

import Foundation

// 1. Придумать класс, методы которого могут завершаться неудачей и возвращать
// либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат
// метода при помощи конструкции if let, или guard let.
//

typealias Login = String
typealias Password = String

struct User
{
    let firstName: String
    let lastName: String
    var password: Password
}

enum UserValidatorErrors: String, Error, LocalizedError
{
    case invalidFirstName = "Недопустимое имя пользователя"
    case invalidLastName = "Недопустимая фамилия пользователя"
    case invalidLogin = "Неверный логин"
    case invalidPass = "Неверный пароль"
    case duplicatedUser = "Пользователь уже существует"
    case userNotFound = "Пользователь не найден"

    public var errorDescription: String?
    { return NSLocalizedString(rawValue, comment: "") }
}

/// класс реализует словарь пользователей .  ключ = логин
enum UserDictionary
{
    private static var users = [Login: User]()

    /// добавить  пользователя
    static func addUser(_ login: Login, _ user: User) -> (User?, Error?)
    {
        let userValidationError = validateNewUser(login, user)
        guard userValidationError == nil
        else { return (nil, userValidationError) }
        guard users[login] == nil
        else { return (nil, UserValidatorErrors.duplicatedUser) }
        users[login] = user
        return (users[login], nil)
    }

    /// удалить пользователя
    static func removeUser(_ login: Login) -> (User?, Error?)
    {
        guard let user = users[login]
        else { return (nil, UserValidatorErrors.userNotFound) }
        users[login] = nil
        return (user, nil)
    }

    /// изменение пароля
    static func setPassword(_ login: Login, _ password: Password) ->
        (Bool, Error?)
    {
        guard users[login] != nil
        else { return (false, UserValidatorErrors.userNotFound) }

        guard validatePassword(password)
        else { return (false, UserValidatorErrors.invalidPass) }

        users[login]!.password = password
        return (true, nil)
    }

    private static func validateNewUser(_ login: Login, _ user: User) ->
        UserValidatorErrors?
    {
        guard validateName(user.firstName)
        else { return UserValidatorErrors.invalidFirstName }

        guard validateName(user.lastName)
        else { return UserValidatorErrors.invalidLastName }

        guard validateLogin(login)
        else { return UserValidatorErrors.invalidLogin }

        guard validatePassword(user.password)
        else { return UserValidatorErrors.invalidPass }

        return nil
    }

    private static func validatePassword(_ password: Password) ->
        Bool
    {
        // не менее 8 символов
        // по крайней мере одна заглавная и одна строчная буква
        // по крайней мере одна цифра и один спецсимвол
        let pattern = #"(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*\d)"# +
            #"(?=.*[ !$%&?._-])"#
        return password.range(of: pattern, options: .regularExpression) != nil
    }

    private static func validateLogin(_ login: Login) ->
        Bool
    {
        // буквы и цифры не менее одного символа
        let pattern = #"^[a-zA-Z\d]+$"#
        return login.range(of: pattern, options: .regularExpression) != nil
    }

    private static func validateName(_ name: String) ->
        Bool
    {
        // латинница или кириллица не менее одного символа
        let pattern = #"^[а-яёА-ЯЁa-zA-Z]+$"#
        return name.range(of: pattern, options: .regularExpression) != nil
    }
}
