import 'dart:async'; // timer를 사용하기 위한 라이브러리 호출

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  int totalPomodoros = 0;
  bool isRunning = false; //동작 여부 확인 변수
  //late 키워드는 나중에 초기화 하겠다고 시스템에게 알리는 것.
  late Timer timer; //Timer-> 정해진 간격에 한번씩 함수 실행이 가능하다.

  //매초마다 실행되는 함수
  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        //다시 처음으로 초기화
        totalPomodoros += 1; // 포모도로 수 1 증가
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
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

//재시작 버튼을 누른 경우
  void onStopPressed() {
    setState(() {
      //다시 처음으로 초기화
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
    });
    timer.cancel();
  }

  String format(int seconds) {
    var duration = Duration(
      seconds: seconds,
    );
    var data = duration.toString().split('.').first.substring(2, 7);
    return data;
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
                format(totalSeconds),
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
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  //눌렀을 때 반응
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  icon: Icon(
                    isRunning
                        ? Icons.pause_circle_outline // 일시정지 아이콘
                        : Icons.play_circle_outline, // 재생 아이콘
                  ),
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.stop_circle_outlined,
                  ),
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: onStopPressed,
                ),
              ],
            )),
          ),
          //하단 부분 - 얼마나 포모도로를 실행했는지?
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
                          "$totalPomodoros",
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
