import 'package:flutter/material.dart';

//컴포넌트 커스터마이징 방법
// 1. 요소 생성
// 2. 해당 요소를 담을 수 있는 커스텀 클래스 작성
// 3. 해당 요소 코드를 복사 후 붙여넣기
// 4. 커스텀이 필요한 부분만 변수로 지정하고, 생성자를 통해 전달받기.
// 5. 해당 요소를 메인에서 불러서 사용하기.

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final bool isInverted;
  final _blackColor = const Color(0xFF1F2123); //private 하게 만들어준다.
  final IconData icon; //아이콘 종류
  final double order;
  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.order, //코드 챌린지 -> 카드 내부에서 offset에 맞게 이동할 수 있도록 만드는 변수
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -order * 10),
      child: Container(
        //clipBehavior 옵션은 Container 내부 요소가 흘러넘칠 때,
        // 어떻게 동작할 지 알려주는 장치!
        // Clip.hardEdge -> 넘치는 부분을 지워줌
        clipBehavior: Clip.hardEdge,
        //박스를 꾸미기 위한 요소
        decoration: BoxDecoration(
          color: isInverted
              ? Colors.white
              : _blackColor, //만약 색상을 반전시켜야 하는 경우, bool값을 true로 설정한다.
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 32,
                      color: isInverted
                          ? _blackColor
                          : Colors
                              .white, //만약 색상을 반전시켜야 하는 경우, bool값을 true로 설정한다.
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted
                              ? _blackColor
                              : Colors
                                  .white, //만약 색상을 반전시켜야 하는 경우, bool값을 true로 설정한다.
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted
                              ? _blackColor
                              : Colors.white.withOpacity(
                                  0.8), //만약 색상을 반전시켜야 하는 경우, bool값을 true로 설정한다.
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              //아이콘 부분(유로)
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(
                    icon,
                    color: isInverted
                        ? _blackColor
                        : Colors
                            .white, //만약 색상을 반전시켜야 하는 경우, bool값을 true로 설정한다.,
                    size: 88,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
