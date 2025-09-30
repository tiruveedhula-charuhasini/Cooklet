//
//  MainView.swift
//  Cooklet
//
//  Created by Nxtwave on 21/07/25.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("SignInBg")
                    .resizable()
                    .ignoresSafeArea(edges: .all)
                
                
                VStack{
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: SignInView()) {
                        Text("Sign In")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .frame(width: 150, height: 50)
                            .foregroundColor(.gray)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                        testContentView()
                }
                .padding(.top, 290)
            }
            
        }
      
    }
}

#Preview {
    MainView()
}


