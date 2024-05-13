//
//  ContentView.swift
//  caoculadora
//
//  Created by Raquel Silva dos Santos on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int?
    
    @State var porteSelecionado: Porte = .pequeno
    
    @State var failedInput = false
    
    @State var zeroInput = false
    
    let tituloPreencherCampos = "Preencha os campos para poder cãocular!"
    
    let tituloCamposZero = "Algum dos campos deve conter valor maior que zero"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20.0) {
                    Text("Qual a idade do seu cão?")
                        .font(.header5)
                        .foregroundColor(Color(.indigo600))
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Anos")
                            .font(.body1)
                            .foregroundColor(Color(.indigo600))
                        TextField("Digite os anos caninos",
                                  value: $years,
                                  format: .number)
                    }
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Meses")
                            .font(.body1)
                            .foregroundColor(Color(.indigo600))
                        TextField("Digite os meses caninos",
                                  value: $months,
                                  format: .number)
                    }
                    
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Porte")
                            .font(.body1)
                            .foregroundColor(Color(.indigo600))
                        
                        Picker("Porte", selection: $porteSelecionado) {
                            ForEach(Porte.allCases, id: \.self) { porte in
                                Text(porte.rawValue)
                                    .tag(porte)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
        //            Divider()

                    Spacer()
                    
                    if let result {
                        Text("Seu cachorro tem, em idade humana...")
                            .font(.body1)
                            .foregroundColor(Color(.indigo600))
                        Text("\(result) anos")
                            .font(.display)
                            .frame(maxHeight: 150)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(.indigo600))
                    } else {
                        Image(ImageResource.clarinha)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 150)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                    Spacer()
                    Button(action: processYears, label: {
                        ZStack {
                            Color(.indigo600)
                            Text("Cãocular")
                                .foregroundStyle(.white)
                                .font(.body1)
                        }
                        .cornerRadius(10)
                    })
                    .frame(height: 50)
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .bold()
                .fontDesign(.rounded)
                .padding()
                .containerRelativeFrame(.vertical)
                .navigationTitle("Cãoculadora")
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.indigo600, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
                .alert(tituloPreencherCampos, isPresented: $failedInput) {
                    Button("OK", role: .cancel, action: {})
                }
                .alert(tituloCamposZero, isPresented: $zeroInput) {
                    Button ("OK", role: .cancel, action: {})
                }
//                .confirmationDialog(tituloPreencherCampos, isPresented: $failedInput, titleVisibility: .visible) {
//                    Button("OK", action: {})
//                }
            }
            .scrollDismissesKeyboard(.immediately)
        }
    }

    func processYears() {
        guard
            let years,
            let months
        else { // so executa se years nao for nil
            print("Preencha o campo de entrada")
            failedInput = true
            return // deve temrinar a execução da função -> return vazio
            // se nao escrevi nada em anos, o botao nao fará nada
        }
        guard years > 0 || months > 0 else {
            print("algum campo tem que ter um valor maior que 0")
            zeroInput = true
            return
        }
        
        result = porteSelecionado.conversaoDeIdade(
            anos: years,
            meses: months
        )
    }
}

#Preview {
    ContentView()
}
