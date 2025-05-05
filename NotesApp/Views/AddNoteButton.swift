//
//  AddNoteButton.swift
//  NotesApp
//
//  Created by Adi Mizrahi on 05/05/2025.
//

import SwiftUI

struct AddNoteButton: View {
    @Binding var showEditor: Bool

    var body: some View {
        Button(action: {
            showEditor = true
        }) {
            Label("Add Note", systemImage: "plus")
        }
    }
}
