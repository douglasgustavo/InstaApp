//
//  LoginView.swift
//  InstaApp
//
//  Created by Douglas Santos on 04/09/21.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var email = ""
    @State var senha = ""
    
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 250, height: 250)
            
            CamposLogin(email: $email, senha: $senha)
            BotoesLogin(email: $email, senha: $senha)
        }
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CamposLogin: View {
    @Binding var email: String
    @Binding var senha: String
    
    var body: some View {
        VStack (spacing: 20) {
            
            TextField("E-mail", text: $email)
                .padding()
                .addBorder(Color.principal, width: 2, cornerRadius: 15)
                .shadow(radius: 2)
            
            SecureField("Senha", text: $senha)
                .padding()
                .addBorder(Color.principal, width: 2, cornerRadius: 15)
                .shadow(radius: 2)
        }
        .padding(.horizontal, 30)
        .padding(.top, 50)
        
    }
}

struct BotoesLogin: View {
    
    @Binding var email: String
    @Binding var senha: String
    
    var firebase = SessionStore()
    
    var body: some View {
        VStack{
            
            Button(action: logarUsuario, label: {
                Text("Entrar")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .padding()
            })
            .frame(width: 200, height: 60)
            .background(Color.principal)
            .cornerRadius(15)
            .shadow(radius: 5)
            
            NavigationLink(
                destination: CadastroView(),
                label: {
                    Text("Cadastre-se")
                        .font(.system(size: 20))
                        .foregroundColor(Color.principal)
                })
                .padding(.top, 30)
            
        }
        .padding(.top, 50)
    }
    
    func logarUsuario(){
        print(email)
        print(senha)
        
        firebase.logarUsuario(email: email, senha: senha) { result, error in
            if let error = error {
                print("Erro ao logar: \(error.localizedDescription)")
            }
        }
    }
}
