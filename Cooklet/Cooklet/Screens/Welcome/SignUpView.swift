//
//  SignUpView.swift
//  Cooklet
//
//  Created by Nxtwave on 21/07/25.
//

import SwiftUI

struct SignUpView: View {
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
                    
                    Text("    Sign Up")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .frame(width: 300, height:30)
                        .foregroundColor(.white)
                    
                    TextField("   Username", text: $viewModel.newUsername)
                        .frame(width: 300, height: 40, alignment: .leading)
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("   Email", text: $viewModel.email)
                        .frame(width: 300, height: 40, alignment: .leading)
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    SecureField("   Password", text: $viewModel.newPassword)
                        .frame(width: 300, height: 40, alignment: .leading)
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    VStack{
                        NavigationLink(destination: HomeView()){
                            Text("Sign Up")
                                .frame(width: 150, height: 40)
                                .background(Color.black)
                                .cornerRadius(10)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor(.white)
                                .padding(.leading,80)
                        }
                    }
                    .padding(.bottom,20)
                    HStack{
                        Text("Already have an account?")
                            .font(.system(size: 15, weight: .regular, design: .default))
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: SignInView()){
                            Text("Sign In")
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
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUpView()
}


