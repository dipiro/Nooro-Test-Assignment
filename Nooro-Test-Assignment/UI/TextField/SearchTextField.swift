//
//  SearchTextField.swift
//  Nooro-Test-Assignment
//
//  Created by piro2 on 12/8/24.
//

import SwiftUI

struct SearchTextField: View {
    @State private var text: String = ""
    
    private var onEvent: (OnEvent) -> ()
    
    // MARK: - Init
    init( onEvent: @escaping (OnEvent) -> ()) {
        self.onEvent = onEvent
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.grayLight
                .clipShape(.rect(cornerRadius: 16))
            
            HStack(spacing: 16) {
                TextField("Search Location", text: $text)
                    .onSubmit {
                        onEvent(.search(text))
                    }
                    .submitLabel(.done)
                
                Rectangle()
                    .fill(.clear)
                    .scaledToFit()
                    .overlay {
                        AppConstants.Icon.search.image
                            .renderingMode(.template)
                            .foregroundStyle(.grayMiddle)
                    }
                    .onTapGesture {
                        onEvent(.search(text))
                    }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 11)
        }
        .frame(height: 46)
    }
}

// MARK: - Func
extension SearchTextField {
    enum OnEvent {
        case search(_ text: String)
    }
}

// MARK: - Preview
#Preview {
    SearchTextField(onEvent: { _ in })
}
