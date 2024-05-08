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
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
                .font(.system(size: 24))
            Text("Anos")
            TextField("Digite a idade canina",
                      value: $years,
                      format: .number)
            Text("Meses")
            TextField("Digite os meses",
                      value: $months,
                      format: .number)
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
