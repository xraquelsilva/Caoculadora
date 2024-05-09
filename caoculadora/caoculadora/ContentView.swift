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
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porte: String = "Pequeno"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            Text("Qual a idade do seu cão?")
                .font(.system(size: 24))
            Text("Anos")
            
            TextField("Digite os anos caninos",
                      value: $years,
                      format: .number)
            Text("Meses")
            TextField("Digite os meses caninos",
                      value: $months,
                      format: .number)
            Text("Porte")
            
            
            Picker("Porte", selection: $porte) {
                ForEach(portes, id: \.self) { porte in
                    Text(porte)
                        .tag(porte)
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
                .background(.green)
            Spacer()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
                    .font(.system(size: 60))
                    .frame(maxHeight: 150)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 20)
            }
            Spacer()
            Button(action: processYears, label: {
                ZStack {
                    Color.blue
                    Text("Cãocular")
                        .foregroundStyle(.white)
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
    }

    func processYears() {
        // idade canina em idade humana = years * 7 + fração de meses do ano * 7
        guard
            let years,
            let months
        else { // so executa se years nao for nil
            print("Preencha o campo de entrada")
            return // deve temrinar a execução da função -> return vazio
            // se nao escrevi nada em anos, o botao nao fará nada
        }
        guard years > 0 || months > 0 else {
            print("algum campo tem que ter um valor maior que 0")
            return
        }
        result = years * 7 + months*7/12
    }
}

#Preview {
    ContentView()
}
