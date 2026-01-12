//
//  ContentView.swift
//  BBQuotes
//
//  Created by ceboi on 02/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab(Constants.bbName, systemImage: "tortoise") {
                FetchView(show: "Breaking Bad")
            }
            Tab(Constants.bcsName, systemImage: "briefcase") {
                FetchView(show: "Better Call Saul")
            }
            Tab(Constants.ecName, systemImage: "car") {
                FetchView(show: "El Camino")
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
