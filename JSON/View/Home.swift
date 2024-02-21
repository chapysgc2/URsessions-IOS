//
//  Home.swift
//  JSON
//
//  Created by Hazel Alain on 19/02/24.
//


import SwiftUI

struct Home: View {
    
    // Se utiliza para acceder al ViewModel que gestiona el estado de autenticación
    @EnvironmentObject var login : PostViewModel
    @StateObject var json = Modelo1ViewModel() //Inicializamos el objeto json con la clase viewmodel
    var body: some View {
        // Se envuelve la vista en un NavigationView para agregar una barra de navegación
        NavigationView {
            // Contenido de la vista
            Text("Bienvenido") // Muestra un texto de bienvenida en la pantalla
            
            
            if json.datosModelo.isEmpty {
                
                ProgressView() //este es un cargador o un spin
                
            }
            else {
                List(json.datosModelo, id:\.id) { item in // \.id agregamos esta propiedad ya que el json ya tiene su id
                    
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.email)
                        
                    }
                }.navigationTitle("JSON") // Establece el título de la barra de navegación
                .navigationBarItems(
                    // Elementos de la barra de navegación
                    leading: Button(action:{
                        // Acción del botón "Salir"
                        // Se elimina el valor almacenado en UserDefaults para la clave "sesion"
                        UserDefaults.standard.removeObject(forKey: "sesion")
                        // Se actualiza el estado de autenticación a 0 en el ViewModel
                        login.authenticated = 0
                    }) {
                        Text("Salir") // Texto del botón "Salir"
                    },
                    trailing: Button(action:{
                        // Acción del botón "Siguiente"
                        // Aquí puedes agregar acciones para ir a la siguiente pantalla, si es necesario
                    }) {
                        Text("Siguiente") // Texto del botón "Siguiente"
                    }
                    
                )
            }
        }
    }
}

