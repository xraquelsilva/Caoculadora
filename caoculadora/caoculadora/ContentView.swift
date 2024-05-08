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
    
    var body: some View {
        VStack(alignment: .leading) {
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
            //aqui fica segment control
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
                    .font(.system(size: 60))
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .shadow(radius: 20)
            }
            Button(action: {
                result = 23
                //calculo da idade convertida
            }, label: {
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
}

#Preview {
    ContentView()
}
