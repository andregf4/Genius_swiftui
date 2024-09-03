//
//  Extensions.swift
//  Gemini
//
//  Created by Andre Gerez Foratto on 05/07/24.
//

import SwiftUI

struct Extensions: View {
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            Text("G")
                .font(.custom("SpicyRice-Regular", size: 500))
                .shadow(color: .white, radius: 20)
        }
    }
}

#Preview {
    Extensions()
}
