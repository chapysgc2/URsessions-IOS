//
//  JSONApp.swift
//  JSON
//
//  Created by Hazel Alain on 18/02/24.
//

import SwiftUI

@main
struct JSONApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        
        let login = PostViewModel()
        WindowGroup {
            ContentView().environmentObject(login)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
