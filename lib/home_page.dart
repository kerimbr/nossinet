import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  WebViewController _webViewController;
  String url = "https://www.nossi.net/";

  Completer<WebViewController> _controller = Completer<WebViewController>();

  int menuItemId = 1;
  bool _loadingPageController=false;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nossi ® Smart Solutions",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300
          ),
        ),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: RefreshIndicator(
          onRefresh: _yenile,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 51),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 55,
                child: Image.asset("assets/nossiql.png",fit: BoxFit.cover,),
              ),
              Text(
                "Nossi ® Smart Solutions",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                ),
              ),
              Divider(),
              ListTile(
                title: Text("Bilgi Bankası"),
                leading: Icon(
                MaterialCommunityIcons.comment_question_outline,
                  color: Colors.deepOrange,
                ),
                onTap: () async {
                  await _webViewController.loadUrl("https://www.nossi.net/bilgi-bankasi");
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text("Whois Sorgulama"),
                leading: Icon(
                  AntDesign.database,
                  color: Colors.deepOrange,
                ),
                onTap: () async {
                  await _webViewController.loadUrl("https://www.nossi.net/whois");
                  Navigator.pop(context);

                },
              ),

              ListTile(
                title: Text("Hakkımızda"),
                leading: Icon(
                  Entypo.info,
                  color: Colors.deepOrange,
                ),
                onTap: () async {
                  await _webViewController.loadUrl("https://www.nossi.net/hakkimizda.html");
                  Navigator.pop(context);

                },
              ),

              ListTile(
                title: Text("İletişim"),
                leading: Icon(
                  AntDesign.contacts,
                  color: Colors.deepOrange,
                ),
                onTap: () async {
                  await _webViewController.loadUrl("https://www.nossi.net/iletisim");
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text("Blog"),
                leading: Icon(
                  FontAwesome5Solid.blog,
                  color: Colors.deepOrange,
                ),
                onTap: () async {
                  await _webViewController.loadUrl("https://www.nossi.net/yazilar");
                  Navigator.pop(context);
                },
              ),

              Divider(),
              ListTile(
                title: Text(
                  "Telefon",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                subtitle: Text(
                  "0850 480 89 39",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16
                  ),
                ),
                onTap: (){
                  launch("tel://08504808939");
                },
              ),

              ListTile(
                title: Text(
                  "E-Posta",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                subtitle: Text(
                  "info@nossi.net",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16
                  ),
                ),
                onTap: (){
                  launch("mailto:info@nossi.net");
                },
              ),
              SizedBox(height: 50),
              Text(
                "Copyright © 2019 Tüm Hakları Saklıdır.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey.shade700
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Feather.shopping_cart),
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () async {
          await _webViewController.loadUrl("https://www.nossi.net/sepet");
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade800,
        elevation: 12,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 5),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  onTap: () async {
                    await _webViewController.loadUrl(url);
                    setState(() {
                      menuItemId = 1;
                    });
                  },
                  child: Container(
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Icon(
                          AntDesign.home,
                          size: 27,
                          color: menuItemId==1?Colors.deepOrange:Colors.white,
                        ),
                        Text(
                          "Keşfet",
                          style: TextStyle(
                              color: menuItemId==1?Colors.deepOrange:Colors.white,
                              fontSize: 11
                          ),
                        ),
                        // SizedBox(width: 25),
                      ],
                    ),
                  ),
                )
            ),
            Container(
                padding: EdgeInsets.only(left: 5),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  onTap: () async {
                    await _webViewController.loadUrl("https://www.nossi.net/alan-adi");
                    setState(() {
                      menuItemId = 2;
                    });
                  },
                  child: Container(
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Icon(
                          AntDesign.tagso,
                          size: 27,
                          color: menuItemId==2?Colors.deepOrange:Colors.white,
                        ),
                        Text(
                          "Sorgula",
                          style: TextStyle(
                              color: menuItemId==2?Colors.deepOrange:Colors.white,
                              fontSize: 11
                          ),
                        ),
                        // SizedBox(width: 25),
                      ],
                    ),
                  ),
                )
            ),
            SizedBox(width: 60),

            Container(
                padding: EdgeInsets.only(left: 5),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  onTap: () async {
                    await _webViewController.loadUrl("https://www.nossi.net/hesabim/destek-taleplerim");
                    setState(() {
                      menuItemId = 3;
                    });
                  },
                  child: Container(
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Icon(
                          AntDesign.customerservice,
                          size: 27,
                          color: menuItemId==3?Colors.deepOrange:Colors.white,
                        ),
                        Text(
                          "Destek",
                          style: TextStyle(
                              color: menuItemId==3?Colors.deepOrange:Colors.white,
                              fontSize: 11
                          ),
                        ),
                        // SizedBox(width: 25),
                      ],
                    ),
                  ),
                )
            ),
            Container(
                padding: EdgeInsets.only(left: 5),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  onTap: () async {
                    await _webViewController.loadUrl("https://www.nossi.net/hesabim");
                    setState(() {
                      menuItemId = 4;
                    });
                  },
                  child: Container(
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Icon(
                          FontAwesome.user_o,
                          size: 27,
                          color: menuItemId==4?Colors.deepOrange:Colors.white,
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Hesabım",
                          style: TextStyle(
                              color: menuItemId==4?Colors.deepOrange:Colors.white,
                              fontSize: 9.5
                          ),
                        ),
                        // SizedBox(width: 25),
                      ],
                    ),
                  ),
                )
            ),

          ],
        ),
      ),

      body: FutureBuilder(
        future: _loadingPage(),
        builder: (context,ss){
          if(ss.hasData){
            return WillPopScope(
              onWillPop: () async{
                if(await _webViewController.canGoBack()){
                  _webViewController.goBack();
                  return false;
                }else{
                  return false;
                }
              },
              child: SafeArea(
                child: WebView(
                  onWebViewCreated: (WebViewController c){
                    _webViewController = c;
                    _controller.complete(c);
                  },

                  initialUrl: url,
                  javascriptMode: JavascriptMode.unrestricted,

                ),
              ),
            );
          }else{
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: CupertinoActivityIndicator(
                  radius: 22,
                ),
              ),
            );
          }
        },
      ),

    );
  }

  Future<void> _yenile() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  Future<bool> _loadingPage() async{
    await Future.delayed(Duration(seconds: 1));
    _loadingPageController = true;
    return _loadingPageController;
  }
}
