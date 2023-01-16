import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  //build라는 메소드를 필수로 구현해야함.
  //build 메소드 -> Widget의 UI를 구현하는 역할을 함.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   title: Text("Hello Flutter!"),
        // ),
        body: Column(
          //수직 배열을 위해 사용하는 위젯
          children: [
            Row(
              // 수평배열을 위해 사용하는 위젯
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      "Hey Selina,",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
