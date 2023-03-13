import 'dart:async'; // timer를 사용하기 위한 라이브러리 호출

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  bool isRunning = false; //동작 여부 확인 변수
  //late 키워드는 나중에 초기화 하겠다고 시스템에게 알리는 것.
  late Timer timer; //Timer-> 정해진 간격에 한번씩 함수 실행이 가능하다.

  void onTick(Timer timer) {
    setState(() {
      totalSeconds -= 1;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //초에 관한 부분
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "$totalSeconds",
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          //재생버튼에 관한  부분
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                //눌렀을 때 반응
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(
                  isRunning
                      ? Icons.pause_circle_outline // 일시정지 아이콘
                      : Icons.play_circle_outline,
                ),
                iconSize: 120,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          //하단 부분
          Flexible(
            flex: 1,
            child: Row(
              children: [
                //꽉 채워준다.
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
