//
//  SignUpViewModel.swift
//  IChatApp
//
//  Created by claudio.f.raposo on 08/03/22.
//

import Foundation
import FirebaseAuth

class SignUpViewModel: ObservableObject{
    
    var name = ""
    var email = ""
    var password = ""
    
    
    @Published var isLoading = false
    @Published var formInvalid = false
    var alertText = ""
    
    func signUp() {
        isLoading = true
        print("name: \(name) email: \(email), senha: \(password)")
        
        Auth.auth().createUser(withEmail: email, password: password){
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
            print("usuario criado \(user.uid)")
            self.isLoading = false
        }
    }
    
}
