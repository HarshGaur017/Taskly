![Taskly](https://github.com/user-attachments/assets/457437cc-d72d-4d36-ada4-eea1c916d4f2)

# Taskly
**A simple and efficient task management app built with Flutter.**
**Overview**
Taskly is a task management app designed to help users keep track of their daily tasks efficiently. With a minimalistic user interface, Taskly allows users to add, view, and delete tasks, along with the ability to mark them as completed. It integrates with Hive for local storage, ensuring persistence even after the app is closed.

**Features**
Add new tasks with a simple popup dialog.
Display tasks in a list with timestamps.
Mark tasks as completed by tapping the checkbox.
Offline storage with Hive database.
Adaptive design for both Android and iOS.
Sleek UI built with Material Design principles.
**Tech Stack**
Flutter: Front-end framework
Dart: Programming language for Flutter
Hive: Lightweight and fast key-value database
Material Design: UI design system for consistency and accessibility
**Installation**
To get a local copy up and running, follow these steps:
1.Clone the repository:
```
git clone https://github.com/yourusername/taskly.git
```
2.Navigate to the project directory:
```
cd taskly
```
3.Install dependencies:
```
flutter pub get
```
**Usage**
1.Open Taskly on your device.
2.Tap the + button to add a new task.
3.Enter the task details and submit.
4.View the task in the list, and mark it complete by tapping the checkbox icon.
5.The completed tasks will be indicated by a strikethrough.

**Project Structure**
```
taskly/
├── android/                 # Android native files
├── ios/                     # iOS native files
├── lib/
│   ├── models/              # Models used for task objects
│   ├── pages/               # Screens of the app
│   └── main.dart            # Main app entry point
├── assets/                  # App assets (icons, images)
├── pubspec.yaml             # App configuration and dependencies
└── README.md                # Project documentation
```
**Contributing**
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

1.Fork the Project.
2.Create your feature branch: `git checkout -b feature/AmazingFeature`.
3.Commit your changes: `git commit -m 'Add some AmazingFeature'`.
4.Push to the branch: `git push origin feature/AmazingFeature`.
5.Open a pull request.

**Acknowledgments**
* Flutter
* Hive

