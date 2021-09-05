//
//  ContentView.swift
//  InstaApp
//
//  Created by Douglas Santos on 04/09/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func getUser(){
        session.lister()
    }
    
    var body: some View {
        Group{
            if session.session != nil {
                HomeTabView()
            } else {
                NavigationView{
                    LoginView()
                }
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
