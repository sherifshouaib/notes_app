# 📝 Notes App

A simple and clean **Flutter Notes Application** that allows users to create, edit, search, and organize their notes easily.
The app focuses on providing a smooth user experience with a minimal UI and efficient local data storage.

---

## 🚀 Features

### 🏠 Home View

* Displays all created notes in a **ListView**.
* Each note shows its **title, content preview, and color**.
* A **floating add button** is located at the bottom right of the screen to create new notes.

### ➕ Add Note

Users can create a new note by:

* Writing a **note title**
* Writing the **note content**
* Choosing a **custom color** for the note

This helps users organize notes visually.

### 🔍 Search Notes

* A **search button** is available at the top right of the home screen.
* When pressed, it navigates to the **Search View**.
* Users can quickly **search for any note** they want.

### ✏️ Edit Notes

* When the user taps any note in the home screen:

  * The app navigates to the **Edit Note View**
* Users can edit:

  * Note **title**
  * Note **content**
  * Note **color**

---

## 🚀 Getting Started

1️⃣ Clone the repository
```bash
git clone https://github.com/your-username/store_app.git
cd project
```

2️⃣ Install dependencies
```bash
flutter pub get
```
3️⃣ Run the project
```bash
flutter run
```


## 🏗 Project Architecture

The project follows a **feature-based architecture** to keep the code organized, scalable, and easy to maintain.

```
lib
│
├── core
│   ├── buttons
│   ├── storage_helper
│   ├── utils
│   └── widgets
│
├── features
│   ├── add_note
│   ├── edit_note
│   ├── home
│   └── search_note
│
├── main_development.dart
└── main_production.dart
```

### Core

Contains reusable components used across the whole application.

* **buttons** → reusable custom buttons
* **storage_helper** → helper functions for working with local storage (Hive)
* **utils** → constants, helpers, and shared utilities
* **widgets** → reusable UI widgets used in multiple features

### Features

Each feature is isolated in its own folder to keep the project modular.

* **add_note** → logic and UI for creating new notes
* **edit_note** → editing existing notes
* **home** → displaying notes list
* **search_note** → searching for notes

### Main Files

* **main_development.dart**
  Used for development environment configuration.

* **main_production.dart**
  Used for production builds.

---

## 🧱 State Management

The project uses **Bloc (Cubit)** for state management to handle application states in a clean and scalable way.

---

## 💾 Local Storage

The app uses **Hive** as a lightweight and fast local database to store notes locally on the device.

---

## 📦 Packages Used

| Package                | Purpose                       |
| ---------------------- | ----------------------------- |
| flutter_bloc           | State management              |
| hive                   | Local database                |
| hive_flutter           | Hive integration with Flutter |
| modal_progress_hud_nsn | Loading indicators            |
| font_awesome_flutter   | Icons                         |
| intl                   | Date formatting               |
| path_provider          | Access device directories     |
| firebase_core          | Firebase initialization       |
| firebase_crashlytics   | Crash reporting               |

### Dev Dependencies

* hive_generator
* build_runner

Used for **generating Hive TypeAdapters**.

---

## 🎨 UI

* Simple and clean design
* Custom note colors
* Smooth navigation between screens

---

## 📱 Screens

<div>
 <img src="https://github.com/user-attachments/assets/a78c760b-119e-412b-84eb-0ba9ec0218ca" width="300">
 <img src="https://github.com/user-attachments/assets/7379cb5b-f61e-4b26-91dc-8f88ffd80900" width="300">
 <img src="https://github.com/user-attachments/assets/48a14fd5-2e9f-4978-8055-89b6d064c074" width="300">
 <img src="https://github.com/user-attachments/assets/8cfc95c0-07b5-4f0b-b741-22865e9b4ecf" width="300">
</div>


* Home View
* Add Note View
* Edit Note View
* Search View

---

## 📌 Future Improvements

* Dark mode
* Note categories
* Cloud synchronization
* Note reminders

---

## 👨‍💻 Author

Developed by **Sherif Shouaib**
