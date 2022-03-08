//
//  SignInViewModel.swift
//  IChatApp
//
//  Created by claudio.f.raposo on 07/03/22.
//

import Foundation
import FirebaseAuth

class SignInViewModel: ObservableObject{
    
    var email = ""
    var password = ""
    
    @Published var isLoading = false
    @Published var formInvalid = false
    var alertText = ""
    
    func signIn() {
        isLoading = true
        print("email: \(email), senha: \(password)")
        
        Auth.auth().signIn(withEmail: email, password: password){
            result, err in
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                self.alertText = err!.localizedDescription
                print(err!)
                self.isLoading = false
                return
            }
            self.formInvalid = false
            self.alertText = ""
            print("usuario logado \(user.uid)")
            self.isLoading = false
        }

    }
    
}
