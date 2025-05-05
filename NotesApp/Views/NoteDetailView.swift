//
//  NoteDetailView.swift
//  NotesApp
//
//  Created by Adi Mizrahi on 05/05/2025.
//


import SwiftUI
import MarkdownUI

import SwiftUI

struct NoteDetailView: View {
    @ObservedObject var note: Note

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(note.title ?? "")
                    .font(.largeTitle)
                    .bold()

                Text(note.content ?? "")
                    .font(.body)

                if let imageData = note.imageData,
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Note Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
