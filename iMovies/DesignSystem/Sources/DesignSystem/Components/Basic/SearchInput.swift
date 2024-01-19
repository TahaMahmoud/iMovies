//
//  SearchInput.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import SwiftUI
import Core

public struct SearchInput: View {
    @Binding public var text: String
    public var placeHolder: String
    public var didSearchPressed: Action

    public init(text: Binding<String>,
                placeHolder: String,
                didSearchPressed: @escaping Action) {
        _text = text
        self.placeHolder = placeHolder
        self.didSearchPressed = didSearchPressed
    }

    public var body: some View {
        HStack {
            TextField("", text: $text)
                .placeholder(when: text.isEmpty) {
                    Text(placeHolder).foregroundColor(DesignSystem.colors.secondaryGray)
                }
                .foregroundStyle(DesignSystem.colors.white)

            Spacer()

            Button(action: didSearchPressed) {
                Image(.icSearch)
            }
        }
        .padding()
        .background(DesignSystem.colors.darkGray)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .frame(height: 42)
    }
}

struct InputContainerView_Previews: PreviewProvider {
    static var previews: some View {
        InputContainerView(text: "")
    }
}

struct InputContainerView: View {
    @State var text: String

    var body: some View {
        SearchInput(text: $text,
                    placeHolder: "Movie name") {
            print("")
        }
    }
}
