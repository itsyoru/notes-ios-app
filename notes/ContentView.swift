//
//  ContentView.swift
//  notes
//
//  Created by Fawad Khan on 2/9/25.
//


import SwiftUI

// Note Component
struct NoteComponent: View {
    var title: String
    var content: String
    var createdAt: Date
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title).font(.system(.title3, design: .rounded, weight: .bold))
                
                Text(content.prefix(10))
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.gray)
            }
        }
    }
}


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
                                NoteComponent(title: note.title,                content: note.content,
                                              createdAt: note.createdAt)
                            }
                        }
                        .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                        .listRowSeparator(.hidden)
                        .buttonStyle(.plain)
                    }
                    .listStyle(.plain)
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
        .onAppear() {
            //Testing
            if NotesViewModel.shared.notes.isEmpty {
                NotesViewModel.shared.addNote(title: "Test Title", content: "Test Content")
            }
        }
}
