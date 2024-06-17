import 'package:flutter/material.dart';
import 'package:news_app/src/features/news_service.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsService _newsService = NewsService();
  final TextEditingController _controller = TextEditingController();
  List<dynamic>? _newsArticles;

  void _fetchNews() async {
    final newsArticles = await _newsService.fetchNews(_controller.text);
    setState(() {
      _newsArticles = newsArticles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter search query',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchNews,
              child: const Text('Get News'),
            ),
            const SizedBox(height: 20),
            _newsArticles != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _newsArticles!.length,
                      itemBuilder: (context, index) {
                        final article = _newsArticles![index];
                        return Card(
                          child: ListTile(
                            title: Text(article['title']),
                            subtitle: Text(
                                article['description'] ?? 'No description'),
                            onTap: () {
                              // Implement article detail view
                            },
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
