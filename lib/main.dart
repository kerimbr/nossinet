import 'package:flutter/material.dart';
import 'package:nossinet/splash_screen.dart';

void main(){
  runApp(NossiNetApp());
}


class NossiNetApp extends StatefulWidget {
  @override
  _NossiNetAppState createState() => _NossiNetAppState();
}

class _NossiNetAppState extends State<NossiNetApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nossi Smart Solutions",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: SplashScreen(),
    );
  }

}
