//
//  AppSettings.swift
//  NotesApp
//
//  Created by Adi Mizrahi on 05/05/2025.
//
import SwiftUI
class AppSettings: ObservableObject {
    @AppStorage("fontSize") var fontSize: Double = 14.0
    @AppStorage("hapticsEnabled") var hapticsEnabled = false
}
