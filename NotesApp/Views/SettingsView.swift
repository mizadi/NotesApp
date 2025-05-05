//
//  Settings.swift
//  NotesApp
//
//  Created by Adi Mizrahi on 05/05/2025.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("hapticsEnabled") private var hapticsEnabled = false
    @AppStorage("fontSize") private var fontSize: Double = 14.0

    var body: some View {
        Form {
            Toggle("Enable Dark Mode" ,isOn: $isDarkMode)
            Toggle("Enable Haptics", isOn: $hapticsEnabled)
            Stepper("Font Size: \(Int(fontSize))", value: $fontSize, in: 10...30)
                .padding()
        }
    }
}
