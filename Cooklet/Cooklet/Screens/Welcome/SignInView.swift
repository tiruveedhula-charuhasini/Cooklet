//
//  SignInView.swift
//  Cooklet
//
//  Created by Nxtwave on 18/07/25.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SignInView: View {
   @StateObject var viewModel = MainViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Image("SignInBg")
                    .resizable()
                    .ignoresSafeArea(edges: .all)
                
                VStack(alignment: .leading){
                    Text("   HELLO!")
                        .font(.system(size: 30, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                    
                    Text("    Sign In")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .frame(width: 300, height:30)
                        .foregroundColor(.white)
                    
                    TextField("  Username", text: $viewModel.enteredUsername)
                        .frame(width: 300, height: 45, alignment: .leading)
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    SecureField("   Password", text: $viewModel.enteredPassword)
                        .frame(width: 300, height: 45, alignment: .leading)
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button {
                        viewModel.useAuthentication()
                    } label: {
                        Text("Sign In")
                            .frame(width: 150, height: 40)
                            .background(Color.black)
                            .cornerRadius(10)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .padding(.leading,80)
                    }
                  
                    
                    HStack{
                        Text("Don't have an account")
                            .font(.system(size: 15, weight: .regular, design: .default))
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: SignUpView()){
                            Text("Sign Up")
                                .font(.system(size: 15, weight: .bold, design: .default))
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.leading,50)
                    .padding(.bottom,20)
                }
                .background(Color.gray .opacity(0.5))
                .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
                HomeView()
            }
            .alert("ERROR", isPresented: $viewModel.Alertmsg , actions: {
                Button("OK", role: .cancel) {
                }
            }, message: {
                Text(viewModel.Error)
            }
            )}
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
   SignInView()
}


