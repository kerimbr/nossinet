import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nossinet/check_network.dart';
import 'package:nossinet/home_page.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Route homePage = MaterialPageRoute(builder: (context)=>CheckNetwork());
      Navigator.push(context, homePage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey.shade300,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Image.asset("assets/nossiql.png",fit: BoxFit.cover,)
                  ),
                  SizedBox(height: 0),
                  Text(
                    "Nossi ® Smart Solutions",
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: CupertinoActivityIndicator(
                      radius: 16,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "©Copyright 2017-2020 nossi.com.tr",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
