I'll update the README.md to include the dark/light mode feature and settings view. Here's the modified version:

```markdown
# 📓 NotesApp

A modern iOS note-taking application built with SwiftUI, featuring Markdown support, image attachments, and persistent storage.

## ✨ Features

- 📝 Create, edit, and delete notes
- 🔍 Search through notes
- 🖼️ Attach and view images from the photo library
- 🧠 Markdown-ready content preview (with [MarkdownUI](https://github.com/gonzalezreal/MarkdownUI))
- 🗂️ Persistent storage using Core Data
- 🌓 Customizable appearance with Light/Dark mode toggle
- ⚙️ Settings view for app customization

## 🛠️ Technical Stack

- **SwiftUI** - Modern declarative UI framework
- **Core Data** - Persistent storage solution
- **MarkdownUI** - Markdown rendering
- **PhotosUI** - Image picker integration

## 🏗️ Architecture

### Core Components
| Component | Purpose |
|-----------|---------|
| `NotesListView` | Main screen displaying all notes |
| `NoteEditorView` | Create and edit notes with image support |
| `NoteDetailView` | Detailed note view with Markdown preview |
| `ImagePicker` | Photo library integration |
| `CoreDataManager` | Data persistence layer |
| `SettingsView` | App settings and appearance configuration |
| `AppearanceManager` | Handles light/dark mode preferences |

## 📱 Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.5+

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/adimiz1/NotesApp.git
   ```

2. Open the project:
   ```bash
   cd NotesApp
   open NotesApp.xcodeproj
   ```

3. Build and run the project in Xcode

## 🎨 Appearance

The app supports both light and dark modes:
- Toggle between modes in the Settings view
- Follows system settings by default
- Persists appearance preference between app launches

## 📄 License

MIT License © 2025 Adi Mizrahi

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 🐛 Known Issues

Please report bugs using GitHub issues.
```
