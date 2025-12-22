import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  String selectedCategory = 'general';

  final Map<String, String> categories = {
    'Home': 'general',
    'World': 'world',
    'Business': 'business',
    'Technology': 'technology',
    'Entertainment': 'entertainment',
    'Sports': 'sports',
    'Science': 'science',
    'Health': 'health',
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('The News Post'),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
          foregroundColor: Colors.red,
          titleTextStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),

        // 🔥 SIDEBAR
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFB11226), Color(0xFF8E0E1A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.newspaper,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'The News Post',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Stay informed. Stay ahead.',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),

              // 🔹 Categories
              ...categories.entries.map((entry) {
                final isSelected = selectedCategory == entry.value;
                return ListTile(
                  leading: Icon(
                    _getIcon(entry.key),
                    color: isSelected ? Colors.red : null,
                  ),
                  title: Text(
                    entry.key,
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : null,
                      color: isSelected ? Colors.red : null,
                    ),
                  ),
                  onTap: () {
                    setState(() => selectedCategory = entry.value);
                    Navigator.pop(context); // auto hide sidebar
                  },
                );
              }).toList(),

              const Divider(),

              // 🔹 Settings
              Builder(
                builder: (context) => ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pop(context); // auto hide sidebar
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SettingsScreen(
                          isDark: isDark,
                          onThemeChanged: (val) => setState(() => isDark = val),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        body: HomeScreen(
          isDark: isDark,
          onThemeChanged: (val) => setState(() => isDark = val),
          category: selectedCategory,
        ),
      ),
    );
  }

  // 🔹 Get icon for category
  IconData _getIcon(String key) {
    switch (key) {
      case 'Home':
        return Icons.home;
      case 'World':
        return Icons.public;
      case 'Business':
        return Icons.business;
      case 'Technology':
        return Icons.computer;
      case 'Entertainment':
        return Icons.movie;
      case 'Sports':
        return Icons.sports_soccer;
      case 'Science':
        return Icons.science;
      case 'Health':
        return Icons.health_and_safety;
      default:
        return Icons.article;
    }
  }
}
