import 'package:flutter/material.dart';
import 'package:main_game_app/widgets/game_web_view.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final List<Map<String, String>> games = [
    {
      'title': 'Rush It',
      'image': 'assets/images/rush it.jpg',
      'url': 'https://number-tap-web.web.app',
    },
    {
      'title': 'Know It',
      'image': 'assets/images/puzzle_game.jpg',
      'url': 'https://www.youtube.com/',
    },
    {
      'title': 'Match It',
      'image': 'assets/images/match it.jpg',
      'url': 'https://mathpuzzle-a9cc3.web.app/',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Center(
          child: Text(
            "Main App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final item = games[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          GameWebView(url: item['url']!, title: item['title']!),
                ),
              );
            },
            child: Card(
              elevation: 2,
              color: Colors.black45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(item['image']!, height: 60),
                  const SizedBox(height: 10),
                  Text(
                    item['title']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
