//
//  OnBoardingView.swift
//  OnBoarding
//
//  Created by Sheraz Ahmed on 14/06/2024.
//

import SwiftUI

struct OnBoardingView: View {
    @StateObject private var viewModel = OnBoardingViewModel()
    
    var body: some View {
        VStack {
            TabView(selection: $viewModel.currentTab) {
                ForEach(0..<viewModel.onBoardingContent.count, id: \.self) { index in
                    let item = viewModel.onBoardingContent[index]
                    
                    VStack(spacing: 25) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .foregroundStyle(Color.gray.opacity(0.1))
                            
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                        }
                        
                        VStack {
                            Text(item.headline)
                                .fontWeight(.semibold)
                                .font(.headline)
                            
                            Text(item.subheadline)
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding()
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Footer(viewModel: viewModel)
        }
    }
}

struct Footer: View {
    @ObservedObject var viewModel: OnBoardingViewModel
    
    var body: some View {
        VStack (spacing: 25) {
            PageControl(viewModel: viewModel)
            
            HStack {
                Button {
                    viewModel.skipOnBoarding()
                } label: {
                    HStack {
                        Text("Skip")
                            .foregroundColor(.secondary)
                    }
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                Button {
                    viewModel.goToNextPage()
                } label: {
                    HStack {
                        Text(viewModel.currentTab < viewModel.onBoardingContent.count - 1 ? "Next" : "Get Started")
                            .foregroundColor(.white)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 25)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill()
                    )
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}


struct PageControl: View {
    
    @ObservedObject var viewModel: OnBoardingViewModel
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<viewModel.onBoardingContent.count, id: \.self) { index in
                Rectangle()
                    .fill(index == viewModel.currentTab ? Color.black : Color.gray.opacity(0.5))
                    .frame(width: index == viewModel.currentTab ? 30 : 10, height: index == viewModel.currentTab ? 7 : 5)
                    .cornerRadius(5)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.currentTab)
            }
        }
    }
}



#Preview {
   
    
    OnBoardingView()
}

