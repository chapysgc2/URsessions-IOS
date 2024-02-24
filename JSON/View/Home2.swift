//
//  Home2.swift
//  JSON
//
//  Created by Hazel Alain on 24/02/24.
//

import SwiftUI

struct Home2: View {
    
    // Se crea un objeto Modelo2ViewModel como un objeto @StateObject.
    // Este objeto ViewModel se utiliza para manejar la lógica relacionada con los datos del modelo Modelo2.
    @StateObject var json2 = Modelo2ViewModel()
    
    var body: some View {
        
        // Verifica si el array de datos en el ViewModel está vacío.
        if json2.datosModelo.data.isEmpty {
            // Si el array de datos está vacío, muestra una vista de progreso.
            ProgressView()
        }
        else {
            // Si el array de datos no está vacío, muestra una lista de elementos.
            List(json2.datosModelo.data, id : \.id) { item in
                
                // Para cada elemento en la lista, muestra una fila que contiene la información del usuario.
                HStack{
                    // Muestra la imagen del usuario utilizando el URL de su avatar.
                    // La función data(url:) carga la imagen desde el URL y la convierte en una imagen redimensionable.
                    Image("persona.fill")
                        .data(url : URL(string : item.avatar)!)
                        .frame(width: 80, height : 80)
                        .clipped()
                        .clipShape(Circle())
                    
                    // Muestra el nombre y el correo electrónico del usuario en una pila vertical.
                    VStack(alignment: .leading) {
                        Text(item.first_name)
                            .font(.title)
                        Text(item.email)
                            .font(.subheadline)
                    }
                    
                }.navigationBarTitle("Json con Imagen") // Establece el título de la barra de navegación.
                
            }
            
        }
    }
    
  
}

// Extensión de la vista Image que agrega una función para cargar datos de una URL.
extension Image {
    func data(url : URL) -> Self {
        // Intenta cargar los datos de la URL.
        if let data = try? Data(contentsOf: url) {
            // Si se cargan los datos con éxito, crea una imagen redimensionable a partir de los datos.
            return Image(uiImage: UIImage(data : data)!)
                .resizable()
        }
        
        // Si no se pueden cargar los datos, devuelve la imagen original sin cambios.
        return self
            .resizable()
    }
}
