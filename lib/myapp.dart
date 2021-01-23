import 'dart:math';
import 'dart:ui';

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
  double a, b;
  bool equalpressed = false;
  double ressize = 33;
  double expsize = 40;
  Color expcolor = Colors.white54;
  Color rescolor = Colors.white24;

  String resCal(double a, double b, String op) {
    String res;
    if (op == '+')
      res = (a + b).toString();
    else if (op == '-')
      res = (a - b).toString();
    else if (op == '×')
      res = (a * b).toString();
    else if (op == '÷')
      res = (a / b).toString();
    else if (op == '^') res = pow(a, b).toString();
    if (res.length - res.indexOf('.') > 3)
      res = double.parse(res).toStringAsFixed(4);
    return res;
  }

  void buttonAction(String text) {
    if (text == "AC") {
      val = "";
      res = "";
      op = "";
      B = "";
      a = null;
      equalpressed = false;
      ressize = 33;
      expsize = 40;
      rescolor = Colors.white24;
      expcolor = Colors.white54;
    } else if (text == "=") {
      res = resCal(a, b, op);
      ressize = 63;
      expsize = 34;
      rescolor = Colors.white60;
      expcolor = Colors.white38;
      B = "";
      equalpressed = true;
    } else if (text == '+' ||
        text == '-' ||
        text == '×' ||
        text == '÷' ||
        text == '^') {
      if (op != "" && a != null) {
        a = double.parse(res);
      }
      op = text;
      if (equalpressed == true)
        val = res + text;
      else
        val += text;
      B = "";
      equalpressed = false;
      ressize = 33;
      expsize = 40;
      rescolor = Colors.white24;
      expcolor = Colors.white54;
    } else if (text == '.') {
      val += text;
      if (op != "") B += text;
    } else if (text == '%') {
      a /= 100;
      op = '×';
      val += text;
    } else {
      val += text;
      if (op == '-' && a == null) {
        a = 0 - double.parse(text);
        op = "";
      }
      if (op == "")
        a = double.parse(val);
      else {
        B += text;
        b = double.parse(B);
        res = resCal(a, b, op);
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
      elevation: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.only(
          top: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10, left: 8),
              child: Container(
                height: 236,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          val,
                          style: TextStyle(
                              fontSize: expsize,
                              color: expcolor,
                              fontFamily: 'WorkSans-Light'),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          res,
                          style: TextStyle(
                              fontSize: ressize,
                              color: rescolor,
                              fontFamily: 'WorkSans-Light'),
                          textAlign: TextAlign.right,
                        ),
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding:
                    EdgeInsets.only(top: 35, bottom: 24, left: 5, right: 5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2.8,
                        color: Colors.grey[850],
                        blurRadius: 1.3)
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
                              a = double.parse(val);
                            else {
                              if (B == "")
                                op = "";
                              else {
                                B = B.substring(0, B.length - 1);
                                b = double.parse(B);
                                res = resCal(a, b, op);
                              }
                            }
                            setState(() {});
                          },
                          child: Icon(
                            Icons.backspace_outlined,
                            color: Colors.white54,
                            size: 27,
                          ),
                          shape: CircleBorder(),
                          color: Colors.grey[900],
                          splashColor: Colors.black26,
                          padding: EdgeInsets.all(23),
                          elevation: 8,
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
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
