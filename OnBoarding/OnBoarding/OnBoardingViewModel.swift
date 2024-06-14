//
//  OnBoardingViewModel.swift
//  OnBoarding
//
//  Created by Sheraz Ahmed on 14/06/2024.
//

import SwiftUI

class OnBoardingViewModel: ObservableObject {
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = true
    @Published var currentTab = 0
    
    
    @Published var onBoardingContent: [OnBoarding] = [
        OnBoarding(image: "Illustration1", headline: "Choose a Favourite Food", subheadline: "When you oder Eat Steet, we’ll hook you up with exclusive coupon, specials and rewards"),
        OnBoarding(image: "Illustration2", headline: "Hot Delivery to Home", subheadline: "We make food ordering fasr, simple and free-no matter if you order online or cash"),
        OnBoarding(image: "Illustration3", headline: "Receive the Great Food", subheadline: "You’ll receive the great food within a hour. And get free delivery credits for every order.")
    ]

    
    
    func goToNextPage() {
        if currentTab < onBoardingContent.count - 1 {
            withAnimation {
                currentTab += 1
            }
        } else {
            withAnimation {
                isOnBoarding = false
            }
        }
    }
    
    func skipOnBoarding() {
        withAnimation {
            isOnBoarding = false
        }
    }
}
