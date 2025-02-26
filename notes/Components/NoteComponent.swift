//
//  NoteComponent.swift
//  notes
//
//  Created by Fawad Khan on 2/25/25.
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
            
            Spacer()
            Text(createdAt, format: .dateTime.day().month().year())
        }
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    NoteComponent(title: "Test Title", content: "Test content", createdAt: Date.now)
}
