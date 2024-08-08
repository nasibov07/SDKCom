//
//  TextFieldView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI

public struct CustomTextFieldView: View {
    @State public var frame: (width: CGFloat, height: CGFloat)
    @State private var showPassword: Bool = true
    @State private var textCount: Int = 0
    @FocusState public var amountIsFocused: Bool
    @Binding public var object: ObjectContent
    
    public let onClickTimer: () -> ()
    
    public init(frame:(width: CGFloat, height: CGFloat),
                amountIsFocused: FocusState<Bool>,
                object: Binding<ObjectContent>,
                onClickTimer: @escaping () -> Void) {
        self.frame = frame
        self._amountIsFocused = amountIsFocused
        self._object = object
        self.onClickTimer = onClickTimer
    }

     
    public var body: some View {
        ZStack {
            VStack(spacing: 10, content: {
                //MARK: - Title элемента
                titleElemant()
                bodyTextFieldView()
                bottomMessage()
            })
            .frame(width: frame.width - 20, alignment: .leading)
            .modifier(Shake(animatableData: CGFloat(object.sheaker)))
        }
        .animation(.easeOut, value: object.sheaker)
        .navigationBarHidden(true)
        .onChange(of: self.object.countTimer.canSendCount) { newValue in
            if object.fieldEnum == .codeField {
                object.disabled = (self.object.countTimer.canSendCount == 0) ? true : false
            }
        }
    }
    
    private func bodyTextFieldView() -> some View {
        HStack(content: {
            //MARK: - Текстовое поле элемента
            textFieldElemants()
            
            //MARK: - Иконки
            if object.fieldEnum != .codeField { iconElemants() }
        })
        .modifier(CustomTextFieldDecorator(frame: frame, object: $object))
        .onAppear(perform: {if (object.fieldEnum == .passwordField){ showPassword = false }})
    }
    
    private func iconElemants() -> some View {
        HStack(spacing: 5, content: {
            //MARK: - Иконка глаза
            if object.fieldEnum == .passwordField { eyesIcon() }
            
            //MARK: - Иконка удалить
            //скрыл пока что
            //clearIcon()
        })
    }
    
    private func titleElemant() -> some View {
        HStack(content: {
            Text(object.title)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            Spacer()
        })
        .frame(height: 15, alignment: .leading)
    }
    
    private func textFieldElemants() -> some View {
        ZStack(content: {
            if !showPassword {
                secureFieldElemant()
            } else {
                textFieldElemant()
            }
        })
    }
    
    private func textFieldElemant() -> some View {
            TextField(object.placeholder, text: $object.text, onEditingChanged: { value in
                CustomTextFieldVM.onEditingChanged(in: &object, keyboard: value)
            })
            .onChange(of: self.object.text, perform: { _ in
                CustomTextFieldVM.onChange(in: &object, old: &textCount)
            })
            .disableAutocorrection(true)
            .foregroundColor(AppColor.AppDark.color)
            .keyboardType(object.keyboardType)
            .focused($amountIsFocused)
            .textInputAutocapitalization(.never)
            .disabled(object.disabled) 
    }
    
    private func secureFieldElemant() -> some View {
        SecureField(object.placeholder, text: $object.text)
            .onChange(of: self.object.text, perform: { _ in
                CustomTextFieldVM.onChange(in: &object, old: &textCount)
            })
            .disableAutocorrection(true)
            .foregroundColor(AppColor.AppDark.color)
            .keyboardType(object.keyboardType)
            .focused($amountIsFocused)
            .textInputAutocapitalization(.never)
            .disabled(object.disabled)
    }
    
    private func bottomMessage() -> some View {
        VStack(spacing: 20, content: {
            FieldMessageCell(frame: frame, object: $object)
            
            if object.fieldEnum == .codeField { countTime() }
        })
    }
    
    private func countTime() -> some View {
        VStack(spacing: 0, content: {
            AuthTimer(countTimer: $object.countTimer){
                self.amountIsFocused = false
                if object.countTimer.canSendCount != 0 {
                    object.countTimer.canSendCount -= 1
                    object.countTimer.canSend = .wait
                    object.countTimer.expired = 90
                } else {
                    object.countTimer.canSend = .blocked
                }
                
                CustomTextFieldVM.clear(in: &object)
                onClickTimer()
            }
        })
    }
    
    private func clearIcon() -> some View {
        AppImage.clearIcon.image
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25, alignment: .center)
            .opacity(self.object.text.isEmpty ? 0 : 1)
    }
    
    private func eyesIcon() -> some View {
        VStack {
            if !showPassword {
                AppImage.onShowPassword.image.resizable()
            } else {
                AppImage.offShowPassword.image.resizable()
            }
        }
        .scaledToFit()
        .frame(width: 25, height: 25, alignment: .center)
        .opacity(self.object.text.isEmpty ? 0 : 1)
        .onTapGesture { self.showPassword.toggle() }
    }
    
    private struct CustomTextFieldDecorator: ViewModifier {
        @State var frame: (width: CGFloat, height: CGFloat)
        @Binding var object: ObjectContent
        
        func body(content: Content) -> some View {
            content
                .padding()
                .frame(width: frame.width - 20, height: 55, alignment: .leading)
                .background(object.state.style.backgroundColor.opacity(0.2))
                .overlay(
                    RoundedRectangle(cornerRadius: CGFloat(10))
                        .stroke(object.state.style.borderColor, lineWidth: CGFloat(1))
                )
                .cornerRadius(10)
                .animation(.easeOut(duration: 0.3), value: object.text)
        }
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(frame: (400,0), amountIsFocused: .init(),
                            object: .constant(ObjectContent(title: ".enterPassword",
                                                            placeholder: TitleObject.password.rawValue,
                                                            message: ObjectMessage(id: 0)))){ }
        
    }
}
