//
//  ContentView.swift
//  IChatApp
//
//  Created by claudio.f.raposo on 07/03/22.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Image("chat_logo")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .padding(.horizontal, 50)
                
                TextField("Entre com o seu Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .disableAutocorrection(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24.0)
                            .strokeBorder(Color(UIColor.separator),
                                          style: StrokeStyle(lineWidth: 1.0))
                    )
                    .padding(.bottom, 20)
                
                SecureField("Entre com a sua senha", text: $viewModel.password)
                    .autocapitalization(.none)
                    .disableAutocorrection(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24.0)
                            .strokeBorder(Color(UIColor.separator),
                                          style: StrokeStyle(lineWidth: 1.0))
                    )
                    .padding(.bottom, 30)
                
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                }
                Button{
                    viewModel.signIn()
                } label: {
                    Text("Entrar")
                        .frame( maxWidth: .infinity)
                        .padding()
                        .background(Color.init(red: 22 / 255, green: 147 / 255, blue: 135 / 255))
                        .foregroundColor(Color.white)
                        .cornerRadius(24.0)
                }
                .alert(isPresented:$viewModel.formInvalid){
                    Alert(title: Text(viewModel.alertText))
                }
                
                Divider()
                    .padding()
                
                NavigationLink(
                    destination: SignUpView()){
                    Text("Não tem uma conta? clique aqui!")
                        .foregroundColor(Color.white)
                }
                

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.init(red: 0 / 255, green: 21 / 255, blue: 36 / 255))
            .navigationTitle("Login")
            .navigationBarHidden(true)
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
