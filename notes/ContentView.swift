//
//  ContentView.swift
//  notes
//
//  Created by Fawad Khan on 2/9/25.
//


import SwiftUI

// Sheet View
struct SheetView: View {
    @Binding var showAddSheet: Bool
    @Binding var noteTitle: String
    @Binding var noteContent: String
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                VStack(alignment: .leading) {
                    
                    Text("Title")
                        .font(.headline)
                    
                    TextField(text:$noteTitle) {
                        Text("Type a Note Title")
                    }
                    .textFieldStyle(.roundedBorder)
                }
            }
            .padding()
            .navigationTitle("Add a Title")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView: View {
    // View Model
    @ObservedObject private var viewModel = NotesViewModel.shared
    
    @State private var showAddSheet: Bool = false
    @State private var noteTitle: String = ""
    @State private var noteContent: String = ""
    
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
    SheetView(showAddSheet: .constant(true), noteTitle: .constant("Test"), noteContent: .constant("Test"))
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
