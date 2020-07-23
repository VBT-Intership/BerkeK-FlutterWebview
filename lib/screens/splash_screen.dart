import 'package:flutter/material.dart';
import 'package:flutter_webview_example/helpers/check_connection.dart';
import 'package:flutter_webview_example/models/Content.dart';
import 'package:flutter_webview_example/networks/ContentOperations.dart';
import 'package:flutter_webview_example/screens/error_screen.dart';
import 'package:flutter_webview_example/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CheckConnection checkConnection;
  ContentOperations contentOperations;

  @override
  void initState() {
    super.initState();
    checkConnection = new CheckConnection();
    /* Internet Connection Control */
    checkConnection.checkInternetConnection().then((value) {
      if (value) {
        /* Get Values From Server */
        contentOperations = new ContentOperations();
        contentOperations.fetchAllContents().then((data) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      content: data[0],
                    )),
          );
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ErrorScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Yükleniyor", style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700)),
      ),
    );
  }
}
