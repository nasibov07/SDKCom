//
//  Keyboard.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI

extension View {
    /// Получение ширины экрана
    /// ```
    /// Пример использования: getWidth()
    /// ```
    public func getWidth() -> CGFloat{ UIScreen.main.bounds.width }
    
    /// Получение высоты экрана
    public func getHeight() -> CGFloat{ UIScreen.main.bounds.height }
    
    /// Расширяет окно на все окно
    public func maxSize(alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
    
    public func width(_ width: CGFloat, alignment: Alignment = .center) -> some View {
        frame(width: width, alignment: alignment)
    }

    public func height(_ height: CGFloat, alignment: Alignment = .center) -> some View {
        frame(height: height, alignment: alignment)
    }

    public func maxWidth(alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, alignment: alignment)
    }

    public func maxHeight(alignment: Alignment = .center) -> some View {
        frame(maxHeight: .infinity, alignment: alignment)
    }

    public func autoSize() -> some View {
        fixedSize(horizontal: true, vertical: true)
    }

    public func autoWidth() -> some View {
        fixedSize(horizontal: true, vertical: false)
    }

    public func autoHeight() -> some View {
        fixedSize(horizontal: false, vertical: true)
    }

    public func smallPadding(_ edges: Edge.Set = .all) -> some View {
        padding(edges, 10)
    }

//    func padding(_ edges: Edge.Set = .all) -> some View {
//        padding(edges, 20)
//    }

    public func largePadding(_ edges: Edge.Set = .all) -> some View {
        padding(edges, 40)
    }

    public func shadow() -> some View {
        shadow(color: Color.black.opacity(0.111), radius: 4.888, x: 0, y: 0)
    }
    
    public func glow(color: Color = .red, radius: CGFloat = 20) -> some View {
        self
            .overlay(self.blur(radius: radius / 6))
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    } 
    
    /// Скрыть клавиатуру
    public func dismissKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    /// Создание кнопка для контекстного меню
    /// ```
    /// Пример использования: contextMenuButton(title: "Копировать", imageSystemName: "doc.on.doc", action: { print("hello world") })
    /// ```
    /// - Parameters:
    /// - title: Название кнопка
    /// - imageSystemName: Системное изображение
    /// - action: Код который нужно выполнить при нажатии на кнопку
    ///
    ///- Returns: View кнопки
    public func contextMenuButton(title: String, imageSystemName: String, action: @escaping () -> Void) -> some View {
        Button(action: { action() }, label: { Label(title, systemImage: imageSystemName) })
    }
    
    public func keyboardDismiss(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
	
	public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
		let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
		return clipShape(roundedRect).overlay(roundedRect.strokeBorder(content, lineWidth: width))
	}
}
