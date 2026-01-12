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
                QuoteView(show: "Breaking Bad")
            }
            Tab(Constants.bcsName, systemImage: "briefcase") {
                QuoteView(show: "Better Call Saul")
            }
            Tab(Constants.ecName, systemImage: "car") {
                QuoteView(show: "El Camino")
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
