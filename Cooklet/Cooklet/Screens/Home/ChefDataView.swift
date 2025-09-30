//
//  ChefDataView.swift
//  Cooklet
//
//  Created by Nxtwave on 23/07/25.
//

import SwiftUI

struct ChefDataView: View {
    @StateObject private var viewModel = DataView()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(viewModel.chefs) { chef in
                    VStack {
                        AsyncImage(url: URL(string: chef.image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        )

                        Text(chef.name)
        
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
        }

        .onAppear {
            viewModel.loadChefs()
        }
    }
}
#Preview {
    ChefDataView()
}


