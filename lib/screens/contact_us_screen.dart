import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  // Open email
  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Feedback&body=Hello,',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint('Could not launch $emailUri');
    }
  }

  // Open website
  void _launchWebsite(String url) async {
    final Uri websiteUri = Uri.parse(url);
    if (await canLaunchUrl(websiteUri)) {
      await launchUrl(websiteUri);
    } else {
      debugPrint('Could not launch $websiteUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: const Text('support@thepostnews.com'),
            onTap: () => _launchEmail('support@thepostnews.com'),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Phone'),
            subtitle: const Text('+855 123 456 789'),
            onTap: () => launchUrl(Uri.parse('tel:+855123456789')),
          ),
          ListTile(
            leading: const Icon(Icons.web),
            title: const Text('Website'),
            subtitle: const Text('https://www.yournewsapp.com'),
            onTap: () => _launchWebsite('https://www.yournewsapp.com'),
          ),
        ],
      ),
    );
  }
}
