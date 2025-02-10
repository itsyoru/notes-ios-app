//
//  ContentView.swift
//  notes
//
//  Created by Fawad Khan on 2/9/25.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("😔")
                    .font(.system(size: 45))
                Text("No Notes Found!")
                    .font(.system(size: 28, design: .rounded))
            }
            .navigationTitle("Notes App")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                            .symbolRenderingMode(.hierarchical)
                    }
                    .labelStyle(.iconOnly)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
