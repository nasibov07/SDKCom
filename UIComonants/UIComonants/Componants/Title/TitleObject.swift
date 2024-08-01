//
//  TitleObject.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import Foundation

enum TitleObject: String {    
    enum Timer: String {
        case send = "Получить код повторно"
        case wait = "Получить новый код можно через "
        case blocked = "Количество попыток исчерпано."
    }
    
    case enter = "ВОЙТИ"
    case registration = "РЕГИСТРАЦИЯ"
    case next = "ДАЛЕЕ"
    case register = "ЗАРЕГИСТРИРОВАТЬСЯ"
    case select = "ВЫБРАТЬ"
    case pay = "ОПЛАТИТЬ"
    case forgot = "ЗАБЫЛ ПАРОЛЬ?"
    
    //MARK: - Почта
    case confirmMesssage = "Нажмите ниже «Подтвердить» и мы отправим письмо с кодом для подтверждения email."
    case needEmailAndPhone = "Сначала нужно подтвердить номер телефона или Email в профиле."
    case emailInvalid = "Почта не соответствует требованиям"
    case enterEmailStar = "Введите Email*"
    case enterToEmail = "Войти по почте"
    case editEmail = "Изменить Email"
    case emailMandatoryStar = "Email*"
    case enterEmail = "Введите Email"
    case email = "Email"
    
    //MARK: - Номер телефона
    case enterPhoneNuber = "Введите телефон"
    case editNumber = "Изменить номер"
    case phoneNuber = "Номер телефона"
    case editePhone = "Изменить телефон"
    case phone = "Телефон"
    
    //MARK: - Field
    case mandatoryField = "Это поле должно быть заполнено!"
    case enterPassword = "Введите пароль"
    case password = "Пароль"
    case enterCode = "Введите код"
    case code = "Код"
    case empty = ""
    case whitespace = "Корректные символы для ввода – пробел, дефис, буквы"
    case cancelOrder = "ОТМЕНИТЬ ЗАПИСЬ"
    case cancel = "ОТМЕНИТЬ"
    case yesExit = "ДА, ВЫЙТИ"
    case yesDelete = "ДА, УДАЛИТЬ ПРОФИЛЬ"
     
    enum Auth: String {
        case enter = "Вход"
        case enterAndReq = "Вход/Регистрация"
        case req = "Регистрация"
        case reqUser = "Регистрация пользователя"
        case regClube = "Вступить в АВТОРУСЬ.КЛУБ"
        case removeUser = "Удаление аккаунта"
        case restoringAccess = "Восстановление доступа"
        case enterOrReq = "Войти/зарегистрироваться по номеру"
        case confirm = "Подтвердить"
    }
    
    enum Address: String {
        case address = "Адреса"
        case map = "Карта"
        case list = "Cписок"
    }
    
    enum Profile: String {
        case enterToProfile = "Войти в профиль"
        case exitToProfile = "Выйти из профиля"
        case nameSurname = "Имя, Фамилия"
        case surname = "Фамилия"
        case surnameMandatory = "Фамилия*"
        case name = "Имя"
        case nameMandatory = "Имя*"
        case enterSurname = "Введите фамилию*"
        case enterName = "Введите имя*"
        case enterBirthday = "Введите дату рождения*"
        case selectedBirthday = "Выберите дату рождения*"
        case enterBirthdayData = "Дату рождения*"
        
        case profile = "Профиль"
        case memberClub = "Стать участником АВТОРУСЬ.КЛУБ"
        case profileData = "ДАННЫЕ ПРОФИЛЯ"
        case profileAuth = "АВТОРИЗАЦИЯ"
        case profileSubscription = "ПОДПИСКИ"
        case profileAccaunt = "АККАУНТ"
        case profileUserDelete = "Удалить пользователя"
        case userNotExist = "Пользователь не существует"
        case userHaveExist = "Пользователь уже существует"
        case passwordLineLimit = "Длина пароля не менее 6 символов"
        case passwordLineSaccess = "Пароль соответствует требованиям"
        case fillAllFilder = "Заполните пустое поле"
        case writeFeedBack = "Обратиться в поддержку"
        case acceptPromoCode = "Промокод принят"
        case historyOfOperations = "История операций"
        case historyOfOperationsDescription = "Описание операции:"
        case historyOfOperationsData = "Дата операции:"
        case historyOfOperationsAccruedRub = "Начислено авторублей:"
        case historyOfOperationsDebitedRub = "Списано авторублей:"
    } 
    
    enum Change: String {
        case data = "Изменить данные"
        case birthday = "Дата рождения *"
        case clubMember = "Вы зарегистрированы в программе лояльности. Изменить телефон можно только через службу поддержки."
    }
}
