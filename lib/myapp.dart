import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Widget sizedbox = SizedBox(
    height: 15,
  );

  String res = "0";
  int a, b;
  String op = "";
  String val = "";

  Widget button(String text, Color buttoncolor) {
    return RaisedButton(
      onPressed: () {
        if (text == "AC") {
          val = "";
          res = "0";
          op = "";
        } else if (text == "=") {
          if (op == "+")
            res = (a + b).toString();
          else if (op == "-")
            res = (a - b).toString();
          else if (op == "×")
            res = (a * b).toString();
          else if (op == "÷") res = (a / b).toString();
          op = "";
        } else if (text == "+" || text == "-" || text == "×" || text == "÷") {
          val = val + text;
          op = text;
        } else {
          if (op == "") {
            val = val + text;
            a = int.parse(val);
          } else {
            val = val + text;
            b = int.parse(text);
          }
        }
        setState(() {});
      },
      child: Text(
        text,
        style: TextStyle(
            color: buttoncolor, fontSize: 32, fontFamily: 'WorkSans-Light'),
      ),
      shape: CircleBorder(),
      color: Colors.grey[900],
      splashColor: Colors.black26,
      padding: EdgeInsets.all(18),
      elevation: 12,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    val,
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.white60,
                        fontFamily: 'WorkSans-Light'),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    res,
                    style: TextStyle(
                        fontSize: 70,
                        color: Colors.white60,
                        fontFamily: 'WorkSans-Light'),
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 35, bottom: 24, left: 12, right: 12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2.1,
                      color: Colors.grey[850],
                      blurRadius: 1.0)
                ],
                color: Colors.grey[900],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.backspace_outlined,
                          color: Colors.white60,
                          size: 27,
                        ),
                        shape: CircleBorder(),
                        color: Colors.grey[900],
                        splashColor: Colors.black26,
                        padding: EdgeInsets.all(24),
                        elevation: 12,
                      ),
                      button("^", Colors.white60),
                      button("√", Colors.white60),
                      button("÷", Colors.amber[400])
                    ],
                  ),
                  sizedbox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      button("7", Colors.white),
                      button("8", Colors.white),
                      button("9", Colors.white),
                      button("×", Colors.amber[400])
                    ],
                  ),
                  sizedbox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      button("4", Colors.white),
                      button("5", Colors.white),
                      button("6", Colors.white),
                      button("-", Colors.amber[400])
                    ],
                  ),
                  sizedbox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      button("1", Colors.white),
                      button("2", Colors.white),
                      button("3", Colors.white),
                      button("+", Colors.amber[400])
                    ],
                  ),
                  sizedbox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      button("AC", Colors.white60),
                      button("0", Colors.white),
                      button(".", Colors.white),
                      button("=", Colors.amber[400])
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
