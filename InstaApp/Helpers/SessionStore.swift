//
//  SessionStore.swift
//  InstaApp
//
//  Created by Douglas Santos on 04/09/21.
//

import SwiftUI
import Firebase
import Combine

class SessionStore: ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet {self.didChange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    var firestore = Firestore.firestore()
    
    func lister(){
        handle = Auth.auth().addStateDidChangeListener({ auth, user in
            if let user = user {
                self.session = User(uid: user.uid, email: user.email)
            } else {
                self.session = nil
            }
        })
    }
    
    func retornaUid() -> String {
        if let idUsuario = Auth.auth().currentUser?.uid {
            return idUsuario
        }
        return ""
    }
    
    func criarUsuario(email: String, senha: String, handler: @escaping AuthDataResultCallback){
        Auth.auth().createUser(withEmail: email, password: senha, completion: handler)
        
    }
    
    func logarUsuario(email: String, senha: String, handler: @escaping AuthDataResultCallback){
        Auth.auth().signIn(withEmail: email, password: senha, completion: handler)
    }
    
    func deslogarUsuario(){
        do {
            try Auth.auth().signOut()
            self.session = nil
            lister()
        } catch {
            print("Erro ao deslogar")
        }
    }
    
    func unbind(){
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}

struct User {
    var uid: String
    var email: String?
    
    init(uid: String, email: String?){
        self.uid = uid
        self.email = email
    }
}
