import 'package:flutter/material.dart';
import 'package:toonflix/widgets/currency_card.dart';
import './widgets/button.dart';

//파란줄dm
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  //build라는 메소드를 필수로 구현해야함.
  //build 메소드 -> Widget의 UI를 구현하는 역할을 함.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        // appBar: AppBar(
        //   title: Text("Hello Flutter!"),7
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ), //상하좌우에 10씩 패딩을 넣어줌
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //수직 배열을 위해 사용하는 위젯
            children: [
              //간격을 주기 위해 SizeBox를 사용
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // 수평배열을 위해 사용하는 위젯
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    //children의 요소를 하나씩 쌓으며 내려가는 원리
                    children: [
                      const Text(
                        "Hey Selina",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                "Total balance",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "\$5 194 482",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800, //w는 두께 조절을 위함.
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Button(
                    text: "Transfer",
                    bgColor: Color(0xFFF1B33B),
                    textColor: Colors.black,
                  ),
                  Button(
                    text: "Request",
                    bgColor: Color(0xFF1F2123),
                    textColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              //지갑 부분
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wallets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //카드 요소
              const CurrencyCard(
                name: 'Euro',
                code: 'EUR',
                amount: '6 428',
                icon: Icons.euro_rounded,
                isInverted: false,
              ),
              const CurrencyCard(
                name: 'Bitcoin',
                code: 'BTC',
                amount: '9 785',
                icon: Icons.currency_bitcoin,
                isInverted: true,
              ),
              const CurrencyCard(
                name: 'Euro',
                code: 'EUR',
                amount: '6 428',
                icon: Icons.euro_rounded,
                isInverted: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
