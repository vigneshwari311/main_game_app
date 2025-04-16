import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:main_game_app/widgets/bottom_navigation_main_app.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize(); // Don't await
  RequestConfiguration configuration = RequestConfiguration(
    testDeviceIds: ['e09f93c3-9b84-4469-89aa-0f715265a300'],
  );
  MobileAds.instance.updateRequestConfiguration(configuration);
  runApp( const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: BottomNavigationBarMainApp(),
    );

  }
}