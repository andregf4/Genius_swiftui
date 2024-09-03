//
//  ContentView.swift
//  Gemini
//
//  Created by Andre Gerez Foratto on 04/07/24.
//

import SwiftUI
import GoogleGenerativeAI

struct ContentView: View {
    
    @State var sheetE: Bool = false
    @State var sheetA: Bool = false
    @State var sheetF: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.yellow
                    .ignoresSafeArea()
                VStack {
                    Text("Genius")
                        .font(.custom("SpicyRice-Regular", size: 90))
                        .shadow(color: Color.white, radius: 20)
                    Text("Qual jogo vamos jogar hoje?")
                        .font(.system(size: 27))
                        .fontWeight(.light)
                    Divider()
                        .background(.brown)
                    Spacer ()
                    
                    VStack(spacing: 0.1) {
                        Text("Informações:")
                            .font(.title2)
                        HStack {
                            Button {
                                sheetE.toggle()
                            } label: {
                                Text("E")
                                    .font(.custom("SpicyRice-Regular", size: 30))
                                    .padding()
                                    .foregroundStyle(.darkGreen)
                                    .background(.green)
                                    .clipShape(Circle())
                            }
                            .sheet(isPresented: $sheetE, content: {
                                SheetE()
                                    .presentationDetents([.height(230), .medium, .large])
                            })
                            Button {
                                sheetA.toggle()
                            } label: {
                                Text("A")
                                    .font(.custom("SpicyRice-Regular", size: 30))
                                    .padding()
                                    .foregroundStyle(.darkBlue)
                                    .background(.blue)
                                    .clipShape(Circle())
                            }
                            .sheet(isPresented: $sheetA, content: {
                                SheetA()
                                    .presentationDetents([.height(230), .medium, .large])
                            })
                            Button {
                                sheetF.toggle()
                            } label: {
                                Text("F")
                                    .font(.custom("SpicyRice-Regular", size: 30))
                                    .padding()
                                    .foregroundStyle(.darkPink)
                                    .background(.red)
                                    .clipShape(Circle())
                            }
                            .sheet(isPresented: $sheetF, content: {
                                SheetF()
                                    .presentationDetents([.height(230), .medium, .large])
                            })
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        NavigationLink(destination: Escola()) {
                            Text("Escola")
                                .padding()
                                .frame(width: 315)
                                .background(.green)
                                .cornerRadius(40)
                                .shadow(color: Color.black.opacity(1), radius: 10, x: 10, y: 10)
                        }
                        .tint(.darkGreen)
                        
                        NavigationLink(destination: Academico()) {
                            Text("Acadêmico")
                                .padding()
                                .frame(width: 315)
                                .background(.blue)
                                .cornerRadius(40)
                                .shadow(color: Color.black.opacity(1), radius: 10, x: 10, y: 10)
                        }
                        .tint(.darkBlue)
                        .padding()
                        
                        NavigationLink(destination: Festa()) {
                            Text("Festa")
                                .padding()
                                .frame(width: 315)
                                .background(.red)
                                .cornerRadius(40)
                                .shadow(color: Color.black.opacity(1), radius: 10, x: 10, y: 10)
                        }
                        .tint(.darkPink)
                    }
                    .font(.custom("SpicyRice-Regular", size: 60))
                    
                    Spacer()
                }
            }
        }.accentColor(.yellow)
    }
}

#Preview {
    ContentView()
}
