//
//  ContentView.swift
//  notes
//
//  Created by Fawad Khan on 2/9/25.
//


import SwiftUI

struct ContentView: View {
    // View Model
    @ObservedObject private var viewModel = NotesViewModel.shared
    var body: some View {
        NavigationView {
            
            VStack {
                if !viewModel.notes.isEmpty {
                    
                    List {
                        ScrollView {
                            ForEach(viewModel.notes, id:\.id) {note in
                                Text(note.title)
                            }
                        }
                    }
                } else {
                    
                }

                Text("😔")
                    .font(.system(size: 45))
                Text("No Notes Found!")
                    .font(.system(size: 28, design: .rounded))
            }
            .navigationTitle("Notes App")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        viewModel.addNote(title: "TestNote", content: "Test Content")
                        
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
