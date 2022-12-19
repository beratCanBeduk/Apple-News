//
//  NewsAPPleApp.swift
//  NewsAPPle
//
//  Created by berat can beduk on 14.12.2022.
//

import SwiftUI

@main
struct NewsAPPleApp: App {
    @StateObject var homeViewModel : HomeViewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(homeViewModel)
        }
    }
}
