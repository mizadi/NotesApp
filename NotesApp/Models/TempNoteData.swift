//
//  TempNoteData.swift
//  NotesApp
//
//  Created by Adi Mizrahi on 05/05/2025.
//

import Foundation

struct TempNoteData {
    var title: String = ""
    var content: String = ""
    var imageData: Data? = nil
    
    init() {
            self.title = ""
            self.content = ""
            self.imageData = nil
        }

        init(from note: Note) {
            self.title = note.title ?? ""
            self.content = note.content ?? ""
            self.imageData = note.imageData
        }
}
