import 'dart:math';

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Widget sizedbox = SizedBox(
    height: 15,
  );

  String res = "";
  String val = "";
  String op = "";
  String B = "";
  int a, b;
  bool equalpressed = false;

  String resCal(int a, int b, String op) {
    if (op == '+')
      return (a + b).toString();
    else if (op == '-')
      return (a - b).toString();
    else if (op == '×')
      return (a * b).toString();
    else if (op == '÷')
      return (a / b).toString();
    else if (op == '^') return pow(a, b).toString();
  }

  void buttonAction(String text) {
    if (text == "AC") {
      val = "";
      res = "";
      op = "";
      B = "";
      a = null;
    } else if (text == "=") {
      res = resCal(a, b, op);
      B = "";
      equalpressed = true;
    } else if (text == '%') {
      a = a / 100;
      op = '×';
    } else if (text == '+' ||
        text == '-' ||
        text == '×' ||
        text == '÷' ||
        text == '^') {
      if (op != "" && a != null) {
        res = resCal(a, b, op);
        a = int.parse(res);
      }
      op = text;
      if (equalpressed == true)
        val = res + text;
      else
        val += text;
      B = "";
      equalpressed = false;
    } else {
      val += text;
      if (op == '-' && a == null) {
        a = 0 - int.parse(text);
        op = "";
      }
      if (op == "")
        a = int.parse(val);
      else {
        B += text;
        b = int.parse(B);
      }
    }
  }

  Widget button(String text, Color buttoncolor) {
    return RaisedButton(
      onPressed: () {
        buttonAction(text);
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
                        fontSize: 40,
                        color: Colors.white60,
                        fontFamily: 'WorkSans-Light'),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    res,
                    style: TextStyle(
                        fontSize: 65,
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
                        onPressed: () {
                          val = val.substring(0, val.length - 1);
                          if (op == "")
                            a = int.parse(val);
                          else {
                            if (B == "")
                              op = "";
                            else {
                              B = B.substring(0, B.length - 1);
                              b = int.parse(B);
                            }
                          }
                          setState(() {});
                        },
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
                      button("%", Colors.white60),
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
