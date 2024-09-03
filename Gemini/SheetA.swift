//
//  SheetA.swift
//  Gemini
//
//  Created by Andre Gerez Foratto on 05/07/24.
//

import SwiftUI

struct SheetA: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Acadêmico")
                    .font(.custom("SpicyRice-Regular", size: 40))
                    .underline()
                    .padding()
                Text("Modo de jogo que trata de conteúdos referentes aos âmbitos do Ensino Superior ao Pós-doutorado, englobando as disciplinas presentes no escopo acadêmico.")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
    }
}

#Preview {
    SheetA()
}




