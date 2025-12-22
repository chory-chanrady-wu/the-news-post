import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/article_model.dart';
import '../services/news_service.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final bool isDark;
  final String category;

  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    required this.isDark,
    required this.category,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String selectedCategory;

  // UI name → GNews category
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
  void initState() {
    super.initState();
    selectedCategory = widget.category;
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      setState(() {
        selectedCategory = widget.category;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔴 Top Category Chips
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: categories.entries.map((entry) {
              final isSelected = selectedCategory == entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ChoiceChip(
                  label: Text(entry.key),
                  selected: isSelected,
                  selectedColor: Colors.red,
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  onSelected: (_) {
                    setState(() {
                      selectedCategory = entry.value;
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),

        // 📰 News Content
        Expanded(
          child: FutureBuilder<List<Article>>(
            future: NewsService().fetchNews(selectedCategory),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Error loading news'));
              }

              final articles = snapshot.data!;

              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: articles.length,
                itemBuilder: (_, index) {
                  final article = articles[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(article: article),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.network(
                              article.imageUrl,
                              height: 220,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                height: 220,
                                color: Colors.grey[300],
                                child: const Center(child: Icon(Icons.broken_image)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Title
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              article.title,
                              style: GoogleFonts.merriweather(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Description
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: Text(
                              article.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),

      ],
    );
  }
}
