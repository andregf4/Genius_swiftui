//
//  SheetE.swift
//  Gemini
//
//  Created by Andre Gerez Foratto on 05/07/24.
//

import SwiftUI

struct SheetE: View {
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Escola")
                    .font(.custom("SpicyRice-Regular", size: 40))
                    .underline()
                    .padding()
                Text("Modo de jogo destinado para alunos que se enquadram nos Ensinos Fundamentais I e II e também Ensino Médio, englobando as disciplinas presentes no escopo escolar.")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
    }
}

#Preview {
    SheetE()
}
