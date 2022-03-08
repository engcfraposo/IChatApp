//
//  SignUpView.swift
//  IChatApp
//
//  Created by claudio.f.raposo on 08/03/22.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack{
            Image("chat_logo")
                .resizable()
                .scaledToFit()
                .padding()
                .padding(.horizontal, 50)
            
            TextField("Entre com o seu Nome", text: $viewModel.name)
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
            
            TextField("Entre com o seu email", text: $viewModel.email)
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
                viewModel.signUp()
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
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 32)
        .background(Color.init(red: 0 / 255, green: 21 / 255, blue: 36 / 255))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

