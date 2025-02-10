//
//  NotesViewModel.swift
//  notes
//
//  Created by Fawad Khan on 2/9/25.
//

import Foundation

// View Model

final class NotesViewModel: ObservableObject {
    static let shared = NotesViewModel()
    
    // Storing Notes
    @Published var notes: [Note] = []
    
    // Adding Note Functionality
    @MainActor
    func addNote(title:String, content: String) {
        let newNote = Note(title: title, content: content,
                           createdAt: Date.now)
        
        notes.append(newNote)
    }
    
    // Deleting Note Functionality
    @MainActor
    func deleteNote(_ noteId: UUID) {
        notes.removeAll { foundNote in
            foundNote.id == noteId
        }
    }
}

