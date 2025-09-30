//
//  testContentView.swift
//  Cooklet
//
//  Created by Nxtwave on 15/09/25.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct testContentView: View {
    @StateObject private var viewModel = GoogleAuthViewModel()
    @State private var enterView: Bool = false
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                if viewModel.profile != nil{
                    EmptyView()
                } else {
                    // ❌ User not signed in
                    GoogleSignInButton {
                        Task {
                            await viewModel.signIn()
                            if viewModel.profile != nil{
                               enterView = true
                            }
                            
                        }
                    }
                    .frame(width: 30, height: 50)
                    .padding(.horizontal, 40)
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationDestination(isPresented: $enterView){
                HomeView()
            }
            .padding()
        }
    }
}

#Preview {
    testContentView()
}
