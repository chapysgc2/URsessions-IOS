//
//  Login.swift
//  JSON
//
//  Created by Hazel Alain on 19/02/24.
//

import SwiftUI

struct Login: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    @EnvironmentObject var login : PostViewModel
    var body: some View {
        
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Email").foregroundColor(.white)
                    .bold()
                TextField("Email", text: $email)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress) //agrega la @ en el keyboard
                
                Text("Password")
                    .foregroundColor(.white)
                    .bold()
                
                SecureField("password", text : $password)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action:{
                    login.login(email: email, password: password)
                    
                }){
                    Text("Entrar")
                        .foregroundColor(.white)
                        .bold()
                }
            }.padding(.all)
            
        }
    }
}
