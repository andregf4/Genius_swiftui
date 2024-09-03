//
//  Escola.swift
//  Gemini
//
//  Created by Andre Gerez Foratto on 05/07/24.
//

import SwiftUI
import GoogleGenerativeAI

struct Escola: View {
    
    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
    
    @State var textInput = ""
    @State var aiResponse = ""
    
    @State var disciplinas: [String] = ["Matemática",
                                        "Língua Portuguesa", "Geografia", "Física", "Biologia", "Sociologia", "Língua Inglesa", "História", "Filosofia"]
    @State var disciplinaEscolhida: String = "Matemática"
    
    @State var idadeFinal: Int = 19
    @State var idadeEscolhida: Int = 30
    
    @State var tiposQuestao: [String] = ["Múltipla escolha", "Dissertativa"]
    @State var tipoQuestaoEscolhida: String = "Dissertativa"
    
    @State var dificuldades: [String] = ["Fácil", "Médio", "Difícil"]
    @State var dificuldadeEscolhida: String = "Fácil"
    
    @State var isSpinning: Bool = false
    @FocusState var isFocused: Bool
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            VStack(spacing: 2) {
                
                Text("Escola")
                    .font(.custom("SpicyRice-Regular", size: 60))
                    .foregroundStyle(.darkGreen)
                    .shadow(color: Color.white, radius: 20)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Disciplina: ")
                        Picker("Disciplinas", selection: $disciplinaEscolhida) {
                            ForEach(disciplinas, id: \.self) { d in
                                Text(d)
                            }
                        }
                        .tint(.darkGreen)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: .white, radius: 10)
                        Spacer()
                        Image(systemName: "book.pages.fill")
                            .padding(.trailing, 10)
                    }
                    
                    HStack {
                        Text("Idade: ")
                        Picker("Idade", selection: $idadeEscolhida) {
                            ForEach(7..<idadeFinal, id: \.self) { i in
                                Text("\(i)")
                            }
                        }
                        .tint(.darkGreen)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: .white, radius: 10)
                        Spacer()
                        Image(systemName: "number")
                            .padding(.trailing, 10)
                    }
                    
                    HStack {
                        Text("Questão: ")
                        Picker("Tipo de questão", selection: $tipoQuestaoEscolhida) {
                            ForEach(tiposQuestao, id: \.self) { q in
                                Text("\(q)")
                            }
                        }
                        .tint(.darkGreen)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: .white, radius: 10)
                        Spacer()
                        Image(systemName: "text.bubble")
                            .padding(.trailing, 10)
                    }
                    
                    HStack {
                        Text("Dificuldade: ")
                        Picker("Dificuldade", selection: $dificuldadeEscolhida) {
                            ForEach(dificuldades, id: \.self) { d in
                                Text("\(d)")
                            }
                        }
                        .tint(.darkGreen)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: .white, radius: 10)
                        Spacer()
                        Image(systemName: "dumbbell.fill")
                            .padding(.trailing, 10)
                    }
                }
                .padding(.leading, 20)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundStyle(.white)
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                            .foregroundStyle(.darkGreen)
                            .shadow(radius: 10)
                            .padding([.leading, .trailing])
                        ScrollView {
                                Text(aiResponse)
                                    .font(.system(size: 20))
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.leading)
                                    .animation(.easeInOut(duration: 2))
                            
                        }
                        .padding(25)
                    }
                }
                .padding(.top, 20)
                
                Spacer()
                
                VStack {
                    HStack {
                        TextField("Digite o assunto", text: $textInput)
                            .multilineTextAlignment(.center)
                            .focused($isFocused)
                        Image(systemName: "paperplane.fill")
                            .foregroundStyle(.darkGreen)
                            .onTapGesture {
                                sendMessage(disciplina: disciplinaEscolhida, idade: idadeEscolhida, tipoQuestao: tipoQuestaoEscolhida, dificuldade: dificuldadeEscolhida)
                                isSpinning.toggle()
                                isFocused = false
                            }
                            .rotationEffect(.degrees(isSpinning ? 360 : 0))
                                        .animation(.easeInOut(duration: 1), value: isSpinning)
                        Spacer()
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: .white, radius: 20)
                    .padding()
                    .foregroundStyle(.darkGreen)
                    .font(.system(size: 25))
                }
            }
        }
    }
    
    func sendMessage(disciplina: String, idade: Int, tipoQuestao: String, dificuldade: String) {
        aiResponse = ""
        
        Task {
            do {
                if tipoQuestao == "Dissertativa" {
                    let response = try await model.generateContent("Preciso de um (somente 1) exercício da disciplina de \(disciplina) que seja para um estudante de \(idade) anos sobre o seguinte tema: "+textInput+". Traga somente a pergunta com a estrutura 'Pergunta:', sem nenhum título, e sempre apresente a sua resposta correta logo abaixo, com a estrutura 'Resposta:', sem se preocupar em deixar qualquer palavra do texto em negrito. A pergunta deve exigir uma resposta do tipo \(tipoQuestao), o nível de dificuldade deve ser \(dificuldade) e o linguajar do texto deve ser direcionado a estudantes de 7 a 18 anos, com idioma português brasileiro.")
                    
                    guard let text = response.text else  {
                        textInput = "Sorry, I could not process that.\nPlease try again."
                        return
                    }
                    
                    textInput = ""
                    aiResponse = text
                } else {
                    let response = try await model.generateContent("Preciso de um (somente 1) exercício da disciplina de \(disciplina) que seja para um estudante de \(idade) anos sobre o seguinte tema: "+textInput+". Traga somente a pergunta com a estrutura 'Pergunta:', sem nenhum título, e sempre apresente, obrigatoriamente, a sua resposta correta logo abaixo, com a estrutura 'Resposta:', sem se preocupar em deixar qualquer palavra do texto em negrito. A pergunta deve ser do tipo \(tipoQuestao), ou seja, deve oferecer obrigatoriamente 4 alternativas de resposta com a diagramação 'A)', 'B)', 'C)' ou 'D)', separadas por uma linha. O nível de dificuldade deve ser \(dificuldade) e o linguajar do texto deve ser direcionado a estudantes de 7 a 18 anos, com idioma português brasileiro.")
                    
                    guard let text = response.text else  {
                        textInput = "Sorry, I could not process that.\nPlease try again."
                        return
                    }
                    
                    textInput = ""
                    aiResponse = text
                }
                
            } catch {
                aiResponse = "Something went wrong!\n\(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    Escola()
}
