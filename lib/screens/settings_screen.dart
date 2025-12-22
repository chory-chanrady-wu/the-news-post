import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'contact_us_screen.dart';

class SettingsScreen extends StatefulWidget {
  final bool isDark;
  final Function(bool) onThemeChanged;

  const SettingsScreen({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool darkMode;

  @override
  void initState() {
    super.initState();
    darkMode = widget.isDark;
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      darkMode = value;
    });
    widget.onThemeChanged(value);
  }

  // void _launchEmail() async {
  //   final Uri emailUri = Uri(
  //     scheme: 'mailto',
  //     path: 'support@thepostnews.com',
  //     query: 'subject=Feedback&body=Hello,',
  //   );
  //   if (await canLaunchUrl(emailUri)) {
  //     await launchUrl(emailUri);
  //   } else {
  //     debugPrint('Could not launch $emailUri');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: darkMode,
                  onChanged: _toggleDarkMode,
                  secondary: const Icon(Icons.dark_mode),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Contact Us'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ContactUsScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          // Copyright at the bottom
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '© 2025 The News Post. All rights reserved.',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
