//
//  HomeTabView.swift
//  InstaApp
//
//  Created by Douglas Santos on 04/09/21.
//

import SwiftUI
import Firebase

struct HomeTabView: View {
    @EnvironmentObject var session: SessionStore
    
    @State var viewSelecionada = 0
    
    var firebase = SessionStore()
    
    let opcoes = [
        "rectangle.3.offgrid.fill",
        "magnifyingglass",
        "camera.fill",
        "hand.thumbsup.fill",
        "person.fill"
    ]
    
    var body: some View {
        VStack {
            
            
            ZStack{
                switch viewSelecionada {
                case 0:
                    NavigationView{
                        HomeView()
                    }
                case 1:
                    NavigationView{
                        ProcurarView()
                    }
                case 2:
                    NavigationView{
                        NovaFotoView()
                    }
                case 3:
                    NavigationView{
                        CurtidasView()
                    }
                case 4:
                    NavigationView{
                        PerfilView()
                    }
                default:
                    NavigationView{
                        HomeView()
                    }
                }
            }
            
            Spacer()
            
            HStack(alignment: .top) {
                
                ForEach(0..<opcoes.count, id: \.self) { number in
                    
                    Spacer()
                    Button(action: {
                        self.viewSelecionada = number
                    }, label: {
                        if number == 2 {
                            Image(systemName: opcoes[number])
                                .frame(width: 60, height: 60)
                                .font(.system(size: 25, weight: .regular, design: .default))
                                .foregroundColor(Color.white)
                                .background(Color.principal)
                                .clipShape(Circle())
                                .offset(y: -30)
                                .shadow(radius: self.viewSelecionada == number ? 5 : 0)
                                .animation(.easeInOut)
                        } else {
                            Image(systemName: opcoes[number])
                                .font(.system(size: 25, weight: .regular, design: .default))
                                .foregroundColor(self.viewSelecionada == number ? Color.principal : Color(.systemGray))
                                .shadow(radius: self.viewSelecionada == number ? 5 : 0)
                                .animation(.easeInOut)
                        }
                    })
                    Spacer()
                }
            }
            .frame(height: 80)
            .background(Color(.systemGray5))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
