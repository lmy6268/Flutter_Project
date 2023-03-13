import 'package:flutter/material.dart';
// import 'package:toonflix/widgets/currency_card.dart';
// import './widgets/button.dart';

void main() {
  runApp(const App());
}

/*class App extends StatelessWidget {
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
        body: SingleChildScrollView(
          child: Padding(
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
                  height: 50,
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
                  height: 50,
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
                  order: 0,
                ),
                const CurrencyCard(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '9 785',
                  icon: Icons.currency_bitcoin,
                  isInverted: true,
                  order: 2,
                ),
                const CurrencyCard(
                  name: 'Dollor',
                  code: 'USD',
                  amount: '6 428',
                  icon: Icons.attach_money_outlined,
                  isInverted: false,
                  order: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;
  void toggleTitle() {
    setState(() {
      showTitle = !showTitle; // 값 반전
    });
  }

  List<int> numbers = [];
  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState~");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose!");
  }

  @override
  Widget build(BuildContext context) {
    print("build!");
    return Text(
      "My Large Title",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
