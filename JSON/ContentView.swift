//
//  ContentView.swift
//  JSON
//
//  Created by Hazel Alain on 18/02/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var login : PostViewModel
    var body: some View {
        
        Group {
            if login.authenticated == 0 {
                Login()
            }
            else if login.authenticated == 1 {
                Home()
                
            }
            
            else if login.authenticated == 2 {
                VStack {
                    Text("Usuario y/o contrasena incorrectas")
                    Button(action:{
                        login.authenticated = 0
                    }){
                        Text("Regresar")
                    }
                }
            }
        }
    }
}

