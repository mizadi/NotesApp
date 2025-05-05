//
//  NoteRowView.swift
//  NotesApp
//
//  Created by Adi Mizrahi on 05/05/2025.
//


import SwiftUI

struct NoteRowView: View {
    @EnvironmentObject var settings: AppSettings
    var note: Note

    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title ?? "")
                .font(.system(size: settings.fontSize))
            Text(note.content ?? "")
                .font(.system(size: settings.fontSize))
                .lineLimit(1)
                .foregroundColor(.secondary)
        }
    }
}
