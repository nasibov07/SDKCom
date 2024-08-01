//
//  ValueList.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 17.04.2024.
//

import SwiftUI

public struct ListValue: View {
    @State var title: String?
    @Binding var list: [String]
    let callBack: (_ value: String) -> ()
    
    init(title: String? = nil,
         list: Binding<[String]>,
         callBack: @escaping (_ value: String) -> Void) {
        self.title = title
        self._list = list
        self.callBack = callBack
    }
    
    public var body: some View {
        List{
            if let title = title {
                VStack(alignment: .leading, spacing: 10, content: {
                    Spacer().frame(width: 1, height: 10)
                    Text(title)
                        .font(.system(size: 18))
                        .bold()
                    Spacer().frame(width: 1, height: 10)
                })
            }
            
            ForEach(list.indices, id: \.self) { index in
                Text(list[index])
                    .font(.system(size: 16))
                    .onTapGesture { callBack(list[index]) }
            }
        }
        .listStyle(.inset)
    }
}

#Preview {
    ListValue(title: "Город", list: .constant(["asf","asdf","asf"]), callBack: { _ in})
}
