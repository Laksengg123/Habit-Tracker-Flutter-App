Habit Tracker Flutter App
A simple yet beautiful and animated Habit Tracker application built with Flutter. This app helps users build and maintain good habits by tracking their daily progress in a creative and intuitive way.

✨ Features
🏠 Home Page: View all your habits for the current day and mark them as complete.

📅 Calendar Page: Get a monthly overview of your completed habits. Select any day to see the habits you accomplished.

📝 Activity Management: Easily add new habits or delete existing ones. Choose a custom name, description, and icon for each habit.

👤 Profile Page: View your stats, including completion rate and current streak.

✏️ Edit Profile: Personalize your experience by editing your user name.

🎨 Creative UI & Animations: Smooth animations and a clean, modern user interface to make habit tracking an enjoyable experience.

📸 Screenshots
(You can add screenshots of your app here)

Home Page

Calendar Page

Profile Page







🚀 Getting Started
Follow these instructions to get a copy of the project up and running on your local machine for development and testing.

Prerequisites
You need to have the Flutter SDK installed on your machine. For help, check the official Flutter installation guide.

Installation
Clone the repository:

git clone https://github.com/your-username/habit-tracker-app.git
cd habit-tracker-app

Install dependencies:
Run the following command in your terminal to get all the required packages.

flutter pub get

Run the application:
Open your simulator or connect a physical device and run the app.

flutter run

📂 Project Structure
The project code is structured into several directories inside the lib folder to maintain a clean and scalable architecture.

lib/
├── main.dart             # The main entry point of the application
|
├── models/               # Contains the data models and providers
│   ├── habit.dart
│   └── habit_provider.dart
|
├── screens/              # Contains all the UI screens/pages
│   ├── main_scaffold.dart
│   ├── home_page.dart
│   ├── calendar_page.dart
│   ├── activity_maintenance_page.dart
│   ├── profile_page.dart
│   └── edit_profile_page.dart
|
└── widgets/              # Contains reusable custom widgets
    └── habit_tile.dart

📦 Packages Used
This project uses several open-source packages to work:

provider: For state management.

table_calendar: To display the monthly habit calendar.

flutter_animate: For creating beautiful and complex animations with a simple syntax.

cupertino_icons: Provides the default iOS-style icons.

Made with ❤️ and Flutter.