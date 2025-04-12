import 'package:flutter/material.dart';
import 'package:main_game_app/pages/game_page.dart';
import 'package:main_game_app/pages/profile_page.dart';
import 'package:main_game_app/pages/redeem_page.dart';

import 'leader_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  PageController pageController = PageController();


  void onTapNavigation(int index){
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          GamePage(),
          LeaderBoardPage(),
          ProfilePage(),
          RedeemPage() 
        ],),

      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>
      [
        BottomNavigationBarItem(icon: Icon(Icons.games),label: 'Games'),
        BottomNavigationBarItem(icon: Icon(Icons.leaderboard),label: 'Leaderboard'),
        BottomNavigationBarItem(icon:Icon(Icons.person),label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.savings),label: 'Redeem')
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: onTapNavigation,
      )
    );
  }
}