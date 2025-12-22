import 'package:flutter/material.dart';
import '../models/article_model.dart';


class DetailScreen extends StatefulWidget {
  final Article article;
  const DetailScreen({super.key, required this.article});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isSaved = false;

  @override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.source),
        backgroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),

      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (widget.article.imageUrl.isNotEmpty)
            Image.network(widget.article.imageUrl),
          const SizedBox(height: 12),
          Text(
            widget.article.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(widget.article.content),
        ],
      ),
    );
  }
}
