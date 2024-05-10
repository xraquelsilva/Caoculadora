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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            Text("Qual a idade do seu cão?")
                .font(.header5)
                .foregroundColor(Color(red: 0.30980392156862746, green: 0.27450980392156865, blue: 0.8980392156862745))
            Text("Anos")
                .font(.body1)
                .foregroundColor(Color(red: 0.30980392156862746, green: 0.27450980392156865, blue: 0.8980392156862745))
            
            TextField("Digite os anos caninos",
                      value: $years,
                      format: .number)
            Text("Meses")
                .font(.body1)
                .foregroundColor(Color(red: 0.30980392156862746, green: 0.27450980392156865, blue: 0.8980392156862745))
            TextField("Digite os meses caninos",
                      value: $months,
                      format: .number)
            Text("Porte")
                .font(.body1)
                .foregroundColor(Color(red: 0.30980392156862746, green: 0.27450980392156865, blue: 0.8980392156862745))
            
            
            Picker("Porte", selection: $porteSelecionado) {
                ForEach(Porte.allCases, id: \.self) { porte in
                    Text(porte.rawValue)
                        .tag(porte)
                }
            }
            .pickerStyle(.segmented)
            
//            Divider()

            Spacer()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                    .font(.body1)
                    .foregroundColor(Color(red: 0.30980392156862746, green: 0.27450980392156865, blue: 0.8980392156862745))
                Text("\(result) anos")
                    .font(.display)
                    .frame(maxHeight: 150)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(red: 0.30980392156862746, green: 0.27450980392156865, blue: 0.8980392156862745))
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
                    Color(.blue)
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
    }

    func processYears() {
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
        
        result = porteSelecionado.conversaoDeIdade(
            anos: years,
            meses: months
        )
    }
}

#Preview {
    ContentView()
}
