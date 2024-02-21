//
//  Modelo1ViewModel.swift
//  JSON
//
//  Created by Hazel Alain on 21/02/24.
//

import Foundation

class Modelo1ViewModel : ObservableObject {
    
    @Published var datosModelo : [Modelo1] = []
    
    init() {  //El init siempre se inicia cuando se ejecuta la aplicacion
        
        fecth()
    }
    
    func fecth() {
        
        guard let url = URL(string : "https://jsonplaceholder.typicode.com/users") else { return  }
        URLSession.shared.dataTask(with: url){ data,_,_ in
            
            guard let data = data else { return }
            
            do{
                
                let json = try JSONDecoder().decode([Modelo1].self, from: data) //aqui se pone [Modelo1] entre corchetes por que estamos trayendo muchos datos
                DispatchQueue.main.async { //el dispathc siempre lo tenemos que llamar cuando se traen cosas de internet
                    self.datosModelo = json
                }
            }catch let error as NSError {
                
                print("Error en el json", error.localizedDescription)
                
            }
        }.resume()
    }
}

