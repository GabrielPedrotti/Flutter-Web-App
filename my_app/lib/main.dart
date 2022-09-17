import 'package:flutter/material.dart';
import 'package:web_browser_detect/web_browser_detect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var browserLabel = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Descubra Seu Navegador'),
            // style app bar
            backgroundColor: Colors.blueGrey,
            centerTitle: true,
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
              //set on center
              alignment: Alignment.center,
              margin: EdgeInsets.all(100),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  disabledForegroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  side: const BorderSide(
                      color: Colors.blueGrey,
                      width: 3,
                      style: BorderStyle.solid),
                ),
                child: const Text(
                  'Clique aqui para descobrir seu navegador!',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  // get user's browser and create a text label with it
                  final browser = Browser();
                  setState(() {
                    browserLabel = browser.browser;
                  });
                },
              ),
            ),
            if (browserLabel != "")
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Seu navegador é o ${browserLabel}!',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            if (browserLabel != "")
              Container(
                //create a image with the browser logo
                child: Image.asset(
                  'assets/images/${browserLabel.toLowerCase()}.png',
                  height: 200,
                  width: 200,
                ),
              ),
          ]))),
    );
  }
}
