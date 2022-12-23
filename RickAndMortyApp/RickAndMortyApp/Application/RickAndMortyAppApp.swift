//
//  RickAndMortyAppApp.swift
//  RickAndMortyApp
//
//  Created by Alfonso Miranda on 21/12/22.
//

import SwiftUI

@main
struct RickAndMortyAppApp: App {
    var body: some Scene {
        WindowGroup {
            ListViewFactory.view()
        }
    }
}
