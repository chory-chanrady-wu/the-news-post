class Article {
  final String title;
  final String description;
  final String content;
  final String imageUrl;
  final String url;
  final String source;

  Article({
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.url,
    required this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['image'] ?? '',
      url: json['url'] ?? '',
      source: json['source']['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'content': content,
    'image': imageUrl,
    'url': url,
    'source': {'name': source},
  };
}
