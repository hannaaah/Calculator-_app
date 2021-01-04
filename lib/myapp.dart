import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final Widget sizedbox = SizedBox(
    height: 13,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "0",
              style: TextStyle(
                  fontSize: 70,
                  color: Colors.white60,
                  fontFamily: 'WorkSans-Light'),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.only(top: 35, bottom: 23),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2, color: Colors.grey[850], blurRadius: 1)
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
                          size: 28,
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

Widget button(String text, Color buttoncolor) {
  return RaisedButton(
    onPressed: () {},
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
