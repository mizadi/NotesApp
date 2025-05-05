//
//  NotesListView.swift
//  NotesApp
//
//  Created by Adi Mizrahi on 05/05/2025.
//


import SwiftUI
import CoreData

struct NotesListView: View {
    @State private var searchText = ""
    @State private var showNoteEditor = false
    @State private var tempNote = TempNoteData()
    @State private var showDeleteAlert = false
    @State private var noteToDelete: Note?
    @State private var noteToEdit: Note?
    @Environment(\.managedObjectContext) private var context
    @EnvironmentObject var settings: AppSettings

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.lastUpdated, ascending: false)],
        animation: .default)
    private var notes: FetchedResults<Note>

    var filteredNotes: [Note] {
        if searchText.isEmpty {
            return Array(notes) // Convert FetchedResults to Array
        } else {
            return notes.filter {
                ($0.title ?? "").localizedCaseInsensitiveContains(searchText) ||
                ($0.content ?? "").localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    @State private var showNewNote = false

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredNotes, id: \.objectID) { note in
                    NavigationLink(destination: NoteDetailView(note: note)) {
                        NoteRowView(note: note)
                            .environmentObject(settings)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                noteToDelete = note
                                showDeleteAlert = true
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        Button(role: .none) {
                            withAnimation {
                                noteToEdit = note
                            }
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                    }
                    .alert("Are you sure you want to delete this note?", isPresented: $showDeleteAlert) {
                        Button("Delete", role: .destructive) {
                            // 1. Immediately dismiss the alert
                            showDeleteAlert = false

                            // 2. Delay deletion slightly to let UI settle
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if let note = noteToDelete {
                                    delete(note: note)
                                    noteToDelete = nil
                                }
                            }
                        }

                        Button("Cancel", role: .cancel) {
                            showDeleteAlert = false
                            noteToDelete = nil
                        }
                    }
                }
            }
            .searchable(text: $searchText)

            .navigationTitle("Your Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if settings.hapticsEnabled {
                            let generator = UIImpactFeedbackGenerator(style: .light)
                            generator.impactOccurred()
                        }
                        showNoteEditor = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gear")
                    }
                }
            }
            .sheet(isPresented: $showNoteEditor) {
                newSheetView()
            }
            .sheet(item: $noteToEdit) { note in
                editSheetView(for: note)
            }
        }
    }

    @ViewBuilder
    private func newSheetView() -> some View {
        NoteEditorView(tempNote: $tempNote) {
            let note = Note(context: context)
            note.title = tempNote.title
            note.content = tempNote.content
            note.imageData = tempNote.imageData
            note.lastUpdated = Date()
            try? context.save()
        }
    }

    @ViewBuilder
    private func editSheetView(for note: Note) -> some View {
        let tempData = TempNoteData(from: note)

        NoteEditorView(
            tempNote: .constant(tempData),
            onSave: {
                note.title = tempData.title
                note.content = tempData.content
                note.imageData = tempData.imageData
                note.lastUpdated = Date()
                try? context.save()
            }
        )
    }

    

    private func delete(note: Note) {
        let context = PersistenceController.shared.container.viewContext
        context.delete(note)

        do {
            try context.save()
        } catch {
            print("Failed to delete note: \(error)")
        }
    }
}
