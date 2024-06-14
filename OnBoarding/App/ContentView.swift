//
//  ContentView.swift
//  OnBoarding
//
//  Created by Sheraz Ahmed on 14/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isOnBoarding") var isOnBoarding:Bool = true
    
    var body: some View {
        if isOnBoarding {
            OnBoardingView()
        }else{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
         
        }
    }
}

#Preview {
    ContentView()
}
