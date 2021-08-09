//
//  UserDictionaryThrows.swift
//  7L_ShinkarevAlexey
//
//  Created by Алексей Шинкарев on 05.08.2021.
//

import Foundation

// 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте
// несколько throws-функций. Вызовите их и обработайте результат вызова при
// помощи конструкции try/catch. 

/// класс реализует словарь пользователей .  ключ = логин
class UserDictionaryWithThrows
{
    private static var users = [Login: User]()

    /// добавить  пользователя
    static func addUser(_ login: Login, _ user: User) throws -> User?
    {
        guard users[login] == nil
        else { throw UserValidatorErrors.duplicatedUser }
        guard let userValidationError = validateNewUser(login, user)
        else
        {
            users[login] = user
            return users[login]
        }
        throw userValidationError
    }

    /// удалить пользователя
    static func removeUser(_ login: Login) throws -> User?
    {
        guard let user = users[login]
        else { throw UserValidatorErrors.userNotFound }
        users[login] = nil
        return user
    }

    /// изменение пароля
    static func setPassword(_ login: Login, _ password: Password) throws
    {
        guard users[login] != nil else { throw UserValidatorErrors.userNotFound }

        guard validatePassword(password)
        else { throw UserValidatorErrors.invalidPass }

        users[login]!.password = password
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
        // буквы или цифры не менее одного символа
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
