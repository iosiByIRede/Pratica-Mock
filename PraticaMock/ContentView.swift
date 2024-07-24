//
//  ContentView.swift
//  PraticaMock
//
//  Created by Lais Godinho on 24/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var network: Network
    @State var urlString: String = ""
    @State var text = ""
    @State var subtitle = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Astronomy Picture Of The Day")
                .font(.title2)
            AsyncImage(url: URL(string: urlString)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            HStack {
                Text(subtitle)
                    .font(.subheadline)
            }
            ScrollView {
                Text(text)
            }
        }
        .padding()
        .onAppear {
            Task {
                do {
                    try await network.getPicture()
                    guard let picture = network.picture else {
                        return
                    }
                    
                    urlString = picture.hdurl
                    
                    text = picture.explanation
                    
                    subtitle = picture.title
                    
                    if picture.copyright != nil {
                        subtitle += " by " + picture.copyright!
                    }
                } catch {
                    print(error)
                    fatalError()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Network())
}
