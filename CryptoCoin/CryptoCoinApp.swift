//
//  CryptoCoinApp.swift
//  CryptoCoin
//
//  Created by Jiten Patel on 28/01/23.
//

import SwiftUI

@main
struct CryptoCoinApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .environmentObject(vm)
        }
    }
}
