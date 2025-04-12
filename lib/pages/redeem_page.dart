import 'package:flutter/material.dart';
import 'package:main_game_app/widgets/game_web_view.dart';

class RedeemPage extends StatelessWidget {
  const RedeemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Redeem")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Text("USER NAME",
             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            Text(
              'Your score: $userScore', // Display the stored score
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
