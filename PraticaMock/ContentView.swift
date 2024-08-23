//
//  ContentView.swift
//  PraticaMock
//
//  Created by Lais Godinho on 24/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: APODViewModel
    @State var urlString: String = ""
    @State var text = ""
    @State var subtitle = ""
    @State var date = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Astronomy Picture Of The Day")
                .font(.title2)
            DatePicker(selection: $date, displayedComponents: .date) {
                Text("Data")
                    .font(.subheadline)
            }.onChange(of: date) {
                updateView()

            }
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
            updateView()
        }
    }
    
    func resetView() {
        urlString = ""
        text = ""
        subtitle = ""
    }
    
    func updateView() {
        resetView()
        Task {
            do {
                try await viewModel.getPicture(from: date)
                guard let picture = viewModel.picture else {
                    return
                }
                
                urlString = picture.url
                
                text = picture.explanation
                
                if picture.title != nil{
                    subtitle = picture.title!
                }
                
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

#Preview {
    ContentView()
        .environmentObject(APODViewModel(network: NetworkManager.shared))
}
