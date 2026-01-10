//
//  QuoteView.swift
//  BBQuotes
//
//  Created by ceboi on 10/01/26.
//

import SwiftUI

struct QuoteView: View {
    let vm = ViewModel()
    let show: String
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .frame(width: geometry.size.width * 2.7, height: geometry.size.height * 1.2)
                
                VStack {
                    Spacer(minLength: 60)
                    
                    Text("\"\(vm.quote.quote)\"")
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 25))
                        .padding(.horizontal)
                    
                    ZStack (alignment: .bottom) {
                        AsyncImage(url: vm.character.images[0]) { image in
                            image
                                .resizable()
                                .scaledToFill()
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geometry.size.width / 1.1, height: geometry.size.height / 1.8)
                        
                        Text(vm.quote.character)
                            .foregroundStyle(.white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)

                    }
                    .frame(width: geometry.size.width / 1.1, height: geometry.size.height / 1.8)
                    .clipShape(.rect(cornerRadius: 50))
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Get Random Quote")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.breakingBadGreen)
                        .clipShape(.rect(cornerRadius: 7))
                        .shadow(color: .breakingBadYellow, radius: 2)
                    }
                    
                    Spacer(minLength: 95)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
        .preferredColorScheme(.dark)
}
