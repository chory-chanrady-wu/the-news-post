# Flutter News App

A modern, feature-rich mobile news application built with Flutter that delivers the latest news from around the world.

## 📱 Features

- **Real-time News Updates**: Fetch the latest news articles from multiple categories
- **Multiple News Categories**:

  - Home (General)
  - World
  - Business
  - Technology
  - Entertainment
  - Sports
  - Science
  - Health

- **Dark Mode Support**: Toggle between light and dark themes for comfortable reading
- **Article Details**: View full article content with images and descriptions
- **Contact Us**: Built-in contact form for user feedback
- **Settings Screen**: Customize app preferences and appearance
- **Responsive Design**: Optimized for different screen sizes
- **Persistent Preferences**: User settings are saved locally using SharedPreferences

## 🎯 App Structure

```
lib/
├── main.dart                  # Application entry point and main navigation
├── models/
│   └── article_model.dart    # Article data model
├── screens/
│   ├── home_screen.dart      # Home page with news feed
│   ├── detail_screen.dart    # Individual article detail view
│   ├── settings_screen.dart  # User preferences
│   └── contact_us_screen.dart # Contact form
├── services/
│   └── news_service.dart     # News API integration (GNews API)
└── widgets/
    └── [Custom UI components]
```

## 🔧 Technologies Used

- **Framework**: Flutter 3.10.1+
- **Language**: Dart
- **HTTP Client**: http ^1.2.0
- **Local Storage**: shared_preferences ^2.2.2
- **Typography**: google_fonts ^6.1.0
- **URL Handling**: url_launcher ^6.1.10
- **Localization**: intl ^0.20.2
- **Icons**: cupertino_icons ^1.0.8

## 📡 API Integration

The app uses the **GNews API** for fetching news articles:

- **Base URL**: https://gnews.io/api/v4
- **Endpoint**: `/top-headlines`
- **Supported Parameters**: category, language, country
- **API Key**: Configured in `news_service.dart`

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.10.1 or higher
- Dart SDK
- Android Studio / Xcode (for emulator/simulator)

### Installation

1. Clone the repository:

```bash
git clone [repository-url]
cd flutter_news_app
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

4. For release build:

```bash
flutter build apk      # Android
flutter build ios      # iOS
```

## 📋 Project Configuration

### pubspec.yaml

Key dependencies configured:

- `flutter_localizations` & `intl`: Multi-language support
- `google_fonts`: Custom font styling
- `shared_preferences`: Local data persistence
- `url_launcher`: Open URLs and email functionality
- `http`: HTTP requests for API calls

### Theme Configuration

- **Light Mode**: Default white theme with red accents
- **Dark Mode**: Full dark theme support
- **Colors**: Customizable through ThemeData

## 🎨 User Interface

### Home Screen

- Displays news articles in a card-based layout
- Category filtering on the sidebar
- Pull-to-refresh functionality
- Loading and error states

### Detail Screen

- Full article view with images
- Article title, description, and content
- Source attribution
- Open in browser link

### Settings Screen

- Dark mode toggle
- Appearance preferences
- App configuration

### Contact Us Screen

- User feedback form
- Contact information
- Email integration

## 💾 Data Management

- **Article Model**: Handles article data with JSON serialization
- **News Service**: Manages API calls and data fetching
- **Local Storage**: SharedPreferences for user settings

## 🔐 Security Notes

- API key is stored in the app (consider environment variables for production)
- HTTPS used for all API calls
- Input validation on contact forms

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web (with responsive design)
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🐛 Development Notes

- **State Management**: Uses StatefulWidget for app-level state
- **Navigation**: Flutter's native Navigator
- **Error Handling**: Try-catch blocks for API failures
- **Localization**: Supports multiple languages via intl package

## 📄 License

This project is part of the MCST-2024 Semester 5 Mobile App Development coursework.

## 👤 Author

Mobile App Development Project - Semester 5, 2024

## 🤝 Contributing

This is a coursework project. Modifications should follow Flutter best practices and maintain code quality standards.

## 📞 Support

For issues or questions, use the Contact Us feature within the app or check the settings screen for more options.

---

**Last Updated**: December 2024
