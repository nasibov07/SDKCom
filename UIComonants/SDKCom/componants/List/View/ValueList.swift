//
//  ValueList.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 17.04.2024.
//

import SwiftUI

public struct ListValue: View {
	@Binding public var list: [String]
	
    public var title: String?
    public let callBack: (_ value: String) -> ()
    
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
	ListValue(list: .constant(["asf","asdf","asf"]), title: "Город", callBack: { _ in})
}
