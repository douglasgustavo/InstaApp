//
//  StorieView.swift
//  InstaApp
//
//  Created by Douglas Santos on 04/09/21.
//

import SwiftUI

struct StorieView: View {
    var fotoPerfil: String = "user"
    @State var possuiStorie: Bool = true
    
    var body: some View {
        HStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(fotoPerfil)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: possuiStorie ? 13 : 10)
                            .foregroundColor(.white)
                    )
                    .overlay(
                        Circle()
                            .stroke(lineWidth: possuiStorie ? 4 : 1)
                            .foregroundColor(possuiStorie ? Color.principal : Color(.systemGray4))
                    )
            })
        }
    }
}

struct StorieView_Previews: PreviewProvider {
    
    static var previews: some View {
        StorieView()
    }
}
