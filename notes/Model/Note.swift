//
//  Note.swift
//  notes
//
//  Created by Fawad Khan on 2/9/25.
//

import Foundation

struct Note {
    let id: UUID = UUID()
    
    var title: String
    var content: String
    var createdAt: Date
}


