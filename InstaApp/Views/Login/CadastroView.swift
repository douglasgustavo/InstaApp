//
//  CadastroView.swift
//  InstaApp
//
//  Created by Douglas Santos on 04/09/21.
//

import SwiftUI

struct CadastroView: View {
    
    @State var email = ""
    @State var senha = ""
    @State var confirmaSenha = ""
    @State var validaSenha = false
    
    @State var alerta = false
    @State var erroAlerta = ""
    
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
            
            CamposCadastro(
                email: $email,
                senha: $senha,
                confirmaSenha: $confirmaSenha,
                validaSenha: $validaSenha,
                alerta: $alerta,
                erroAlerta: $erroAlerta
            )
            
            BotoesCadastro(
                email: $email,
                senha: $senha,
                confirmaSenha: $confirmaSenha,
                validaSenha: $validaSenha,
                alerta: $alerta,
                erroAlerta: $erroAlerta
            )
            
        }
        .navigationBarTitle("Cadastre-se")
        .navigationBarHidden(false)
        
    }
}

struct CadastroView_Previews: PreviewProvider {
    static var previews: some View {
        CadastroView()
    }
}

struct CamposCadastro: View {
    @Binding var email: String
    @Binding var senha: String
    @Binding var confirmaSenha: String
    @Binding var validaSenha: Bool
    @Binding var alerta: Bool
    @Binding var erroAlerta: String
    
    var body: some View {
        VStack (spacing: 20) {
            
            TextField("E-mail", text: $email)
                .padding()
                .addBorder(Color.principal, width: 2, cornerRadius: 15)
                .shadow(radius: 2)
            
            SecureField("Digite uma senha", text: $senha)
                .padding()
                .addBorder(validaSenha ? Color.danger : Color.principal, width: 2, cornerRadius: 15)
                .shadow(radius: 2)
            
            SecureField("Digite novamente", text: $confirmaSenha)
                .padding()
                .addBorder(validaSenha ? Color.danger : Color.principal, width: 2, cornerRadius: 15)
                .shadow(radius: 2)
        }
        .alert(isPresented: $alerta, content: {
            Alert(title: Text("Atenção"), message: Text(erroAlerta), dismissButton: .default(Text("Ok")))
        })
        .padding(.horizontal, 30)
        .padding(.top, 50)
    }
}

struct BotoesCadastro: View {
    
    @Binding var email: String
    @Binding var senha: String
    @Binding var confirmaSenha: String
    @Binding var validaSenha: Bool
    @Binding var alerta: Bool
    @Binding var erroAlerta: String
    
    var firebase = SessionStore()
    
    var body: some View {
        VStack{
            
            Button(action: cadastrarUsuario, label: {
                Text("Cadastrar")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .padding()
            })
            .frame(width: 200, height: 60)
            .background(Color.principal)
            .cornerRadius(15)
            .shadow(radius: 5)
            
            NavigationLink(
                destination: LoginView(),
                label: {
                    Text("Voltar")
                        .font(.system(size: 20))
                        .foregroundColor(Color.principal)
                })
                .padding(.top, 30)
            
        }
        .padding(.top, 50)
    }
    
    func cadastrarUsuario(){
        if senha != confirmaSenha {
            self.erroAlerta = "As senhas não são iguais."
            self.alerta = true
            self.validaSenha = true
            return
        } else if senha.isEmpty || confirmaSenha.isEmpty {
            self.erroAlerta = "Preencha todos os campos"
            self.alerta = true
            self.validaSenha = true
            return
        } else {
            self.validaSenha = false
            UIApplication.shared.endEditing()
        }
        
        firebase.criarUsuario(email: email, senha: senha) { result, error in
            if let error = error {
                print("Erro ao cadastrar usuário: \(error.localizedDescription)")
            }
        }
    }
}
