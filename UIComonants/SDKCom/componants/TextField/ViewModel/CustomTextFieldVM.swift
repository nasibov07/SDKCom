import Foundation

final class CustomTextFieldVM { }

//MARK: - onEditingChanged
extension CustomTextFieldVM {
    class func onEditingChanged(in obj: inout ObjectContent, keyboard value: Bool) {
        let count = obj.text.count
        obj.keyboardActive = value
        
        if value {
            return setValueMessageField(in: &obj, objectState: .atcive)
        } else {
            guard count != 0 else {
                return setValueMessageField(in: &obj, objectState: .normal)
            }
            
            if obj.fieldEnum != .phoneField {
                guard !obj.text.contains(" ") else {
                    setValueMessageField(in: &obj, objectState: .error, messageTitle: TitleObject.whitespace.rawValue)
                    return
                }
            }
            
            //TODO: - Имправиить
            guard count >= obj.minLimitValue else {
                setValueMessageField(in: &obj, objectState: .error, messageTitle: "Длина поля не менее \(obj.minLimitValue) символов")
                return
            }
            
            guard count <= obj.maxLimitValue else {
                setValueMessageField(in: &obj, objectState: .error, messageTitle: "Длина поля не более \(obj.maxLimitValue) символов")
                return
            }
            
            if obj.fieldEnum == .emailField {
                guard obj.text.isValidEmail() else {
                    setValueMessageField(in: &obj, objectState: .error, messageTitle: TitleObject.emailInvalid.rawValue)
                    return
                }
            }
            
            obj.state = .fill
        }
    }
    
    class func zeroingOut(in obj: inout ObjectContent) {
        obj.state = .normal
        obj.message.title = ""
        obj.message.state = .normal
    }
    
    class func clear(in obj: inout ObjectContent) {
        obj.text = ""
        obj.state = .normal
        obj.message.state = .normal
        obj.message.title = ""
    }
        
    class func setValueMessageField(in obj: inout ObjectContent,
                              objectState: TextFilderState,
                              messageState: TextFilderState? = nil,
                              messageTitle: String? = nil,
                              icon: (error: String?, success: String?)? = nil) {
        obj.state = objectState
        obj.message.state = messageState ?? objectState
        if messageTitle != nil {
            obj.message.title = messageTitle!
        }
        obj.message.icon = icon ?? (nil, nil)
    }
}

//MARK: - onChange
extension CustomTextFieldVM {
    class func onChange(in obj: inout ObjectContent, old textCount: inout Int) {
        guard obj.text.count <= obj.maxLimitValue else {
            return obj.text = String(obj.text.dropLast(1))
        }
          
        if (obj.text.count < obj.maxLimitValue) {
            self.setValueMessageField(in: &obj,
                                      objectState: obj.keyboardActive ? .atcive : .normal)
        }
       
        
        if obj.fieldEnum == .phoneField {
            CustomTextFieldVM.phoneFormat(in: &obj, old: textCount)
        }
        
        textCount = obj.text.count
    }
    
    class func phoneFormat(in obj: inout ObjectContent, old textCount: Int) {
        let count = obj.text.count
        let text = obj.text
        
        if textCount < count {
            //Добавляется новый элемент
            switch text.count {
            case 1:  do {
                let number = (text == "7") ? "+7" : "+7\(text)"
				obj.text = PhoneFormat.format(phoneNumber: number, shouldRemoveLastDigit: false) }
            case 2:  do {
                let number = (text == "+7") ? "+7" : "+7\(text)"
				obj.text = PhoneFormat.format(phoneNumber: number, shouldRemoveLastDigit: false) }
            default: do {
				obj.text = PhoneFormat.format(phoneNumber: text, shouldRemoveLastDigit: false) }
            }
        } else {
            //Удаляется элемент
            obj.text = PhoneFormat.format(phoneNumber: text, shouldRemoveLastDigit: true)
        }
    }
}
 
extension CustomTextFieldVM {
    class func cheakEmailField(in obj: inout ObjectContent) -> Bool {

        guard !obj.text.isEmpty else {
            setValueMessageField(in: &obj, objectState: .error, messageTitle: "Введите почту")
            return false
        }

        setValueMessageField(in: &obj, objectState: .fill, messageState: .normal, messageTitle: "")
        
        guard obj.text.isValidEmail() else {
            setValueMessageField(in: &obj, objectState: .error, messageTitle: "Почта не соответствует требованиям")
            return false
        }

        return true
    }
}

