//
//  IChatAppApp.swift
//  IChatApp
//
//  Created by claudio.f.raposo on 07/03/22.
//

import SwiftUI
import Firebase

@main
struct IChatApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}
