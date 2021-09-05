//
//  PostView.swift
//  InstaApp
//
//  Created by Douglas Santos on 04/09/21.
//

import SwiftUI

struct PostView: View {
    var username = ""
    var descricao = ""
    var tempoPostagem = ""
    var curtidas = 0
    var cidade = ""
    var urlFoto = ""
    
    
    var body: some View {
        VStack{
            PostHeader(username: username, cidade: cidade)
            
            Image(urlFoto)
                .resizable()
                .scaledToFill()
                .cornerRadius(5)
                .frame(width: UIScreen.screenWidth - 20, height: 300)
                .padding()
            
            VStack{
                HStack{
                    Image(systemName: "heart")
                    Image(systemName: "bubble.right")
                    Image(systemName: "paperplane")
                    Spacer()
                    Image(systemName: "bookmark")
                }
                
                HStack{
                    HStack(spacing: -15){
                        ForEach(0..<3, id: \.self) { like in
                            StorieView()
                                .scaleEffect(0.3)
                                .frame(width: 30, height: 30)
                        }
                    }
                    HStack (spacing: 5){
                        Text("Curtido por")
                            .font(.caption)
                        Text("\(curtidas) pessoas")
                            .font(.bold(.caption)())
                    }
                    Spacer()
                }
                HStack (spacing: 8){
                    Text(username)
                        .font(.bold(.caption)())
                    Text(descricao)
                        .font(.caption)
                    
                    Spacer()
                }
                HStack{
                    Text("Postado há \(tempoPostagem)")
                        .font(.caption2)
                        .foregroundColor(Color(.systemGray))
                    Spacer()
                }
                .padding(.top, 1)
                
            }
            .padding(.horizontal)
        }
        .padding(.bottom)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}

struct PostHeader: View {
    
    @State var username: String
    @State var cidade: String
    
    var body: some View {
        HStack{
            StorieView()
                .scaleEffect(0.4)
                .frame(width: 30, height: 30)
            
            VStack (alignment: .leading){
                Text(username)
                    .font(.caption)
                
                if cidade != "" {
                    Text(cidade)
                        .font(.caption2)
                }
            }
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "line.horizontal.3.decrease")
                    .foregroundColor(Color(.systemGray))
            })
        }
        .padding(.horizontal)
    }
}
