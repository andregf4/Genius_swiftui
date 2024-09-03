//
//  SheetF.swift
//  Gemini
//
//  Created by Andre Gerez Foratto on 05/07/24.
//

import SwiftUI

struct SheetF: View {
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Festa")
                    .font(.custom("SpicyRice-Regular", size: 40))
                    .underline()
                    .padding()
                Text("Modo de jogo destinado para amigos e famílias, englobando conteúdos totalmente livres a depender da escolha do usuário.")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
    }
}

#Preview {
    SheetF()
}
