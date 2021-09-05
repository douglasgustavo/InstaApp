//
//  HomeView.swift
//  InstaApp
//
//  Created by Douglas Santos on 04/09/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical){
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(0..<10, id: \.self) { storie in
                        StorieView()
                    }
                }.padding()
            }
            .frame(height: 100)
            .padding(.vertical)
            
            
            PostView(
                username: "carlosaugusto",
                descricao: "Festa maravilhosa",
                tempoPostagem: "2 dias",
                curtidas: 253,
                cidade: "Belo Horizone",
                urlFoto: "img2"
            )
            PostView(
                username: "amanda",
                descricao: "Amei",
                tempoPostagem: "3 horas",
                curtidas: 77,
                cidade: "São Paulo",
                urlFoto: "img3"
            )
            PostView(
                username: "juliamacedo",
                descricao: "Com os melhores",
                tempoPostagem: "1 dia",
                curtidas: 535,
                cidade: "Florianópolis",
                urlFoto: "img4"
            )
            PostView(
                username: "sarahalmeida",
                descricao: "Melhor viagem",
                tempoPostagem: "1 semana",
                curtidas: 835,
                cidade: "Ceara",
                urlFoto: "img2"
            )
            PostView(
                username: "vivianedrumond",
                descricao: "Nunca pensei que viveria isso",
                tempoPostagem: "1 hora",
                curtidas: 935,
                cidade: "Los Angeles",
                urlFoto: "img1"
            )
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Home")
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
