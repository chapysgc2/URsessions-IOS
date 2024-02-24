//
//  Modelo2ViewModel.swift
//  JSON
//
//  Created by Hazel Alain on 24/02/24.
//

import Foundation

class Modelo2ViewModel : ObservableObject {
    
    
        
    // La propiedad publicada datosModelo almacena los datos del modelo Modelo2.
    // Se inicializa con un objeto Modelo2 que tiene un array vacío como valor inicial.
    @Published var datosModelo = Modelo2(data : [])

    
    init() {  //El init siempre se inicia cuando se ejecuta la aplicacion
        
        fecth()
    }
    
    func fecth() {
        
        guard let url = URL(string : "https://reqres.in/api/users?page=2") else { return  }
        URLSession.shared.dataTask(with: url){ data,_,_ in
            
            guard let data = data else { return }
            
            do{
                
                let json = try JSONDecoder().decode(Modelo2.self, from: data)
                // Aquí se utiliza Modelo2.self para indicar que esperamos recibir un objeto Modelo2 del JSON decodificado,
                // ya que la URL devuelve un conjunto de datos estructurados como un objeto Modelo2, que contiene un array de usuarios.

                DispatchQueue.main.async { //el dispathc siempre lo tenemos que llamar cuando se traen cosas de internet
                    self.datosModelo = json
                }
            }catch let error as NSError {
                
                print("Error en el json", error.localizedDescription)
                
            }
        }.resume()
    }
}
