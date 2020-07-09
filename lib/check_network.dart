import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nossinet/home_page.dart';


class CheckNetwork extends StatefulWidget {
  @override
  _CheckNetworkState createState() => _CheckNetworkState();
}

class _CheckNetworkState extends State<CheckNetwork> {

  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;
  bool isOnline=false;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  Widget build(BuildContext context) {

    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.none:
        setState(() {
          isOnline = false;

        });
        break;
      case ConnectivityResult.mobile:
        setState(() {
          isOnline = true;

        });
        break;
      case ConnectivityResult.wifi:
        setState(() {
          isOnline = true;
        });
    }





    return FutureBuilder(
      future: _check(),
      builder: (context,ss){
        if(ss.hasData && isOnline){
          return HomePage();
        }else{
          return Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CupertinoActivityIndicator(
                      radius: 18,
                    ),
                    SizedBox(height: 15),
                    Text(
                        "İnternet Bağlantısı Kontrol Ediliyor"
                    ),
                  ],
                ),
              )
          );
        }
      },
    );
  }

  Future<bool> _check() async{
    await Future.delayed(Duration(seconds: 3));
    return isOnline;
  }
}





class MyConnectivity {
  MyConnectivity._internal();

  static final MyConnectivity _instance = MyConnectivity._internal();

  static MyConnectivity get instance => _instance;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  void initialise() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else
        isOnline = false;
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  void disposeStream() => controller.close();
}