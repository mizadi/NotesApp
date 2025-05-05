//
//  NoteEditorView.swift
//  NotesApp
//
//  Created by Adi Mizrahi on 05/05/2025.
//


import SwiftUI
import MarkdownUI

struct NoteEditorView: View {
    @Binding var tempNote: TempNoteData
    @Environment(\.dismiss) private var dismiss
    @State private var showingImagePicker = false

    var onSave: () -> Void

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                TextField("Title", text: $tempNote.title)
                    .font(.title)

                TextEditor(text: $tempNote.content)
                    .frame(height: 300)

                if let data = tempNote.imageData,
                   let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                }

                Button("Add Image") {
                    showingImagePicker = true
                }

                HStack {
                    Button("Save") {
                        onSave()
                        dismiss()
                    }
                    Spacer()
                    Button("Cancel") {
                        dismiss()
                    }
                }
                .padding(.top)
            }
            .padding()
            .navigationTitle("New Note")
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(imageData: $tempNote.imageData)
            }
        }
    }
}
