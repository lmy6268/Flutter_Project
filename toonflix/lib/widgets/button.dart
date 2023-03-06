import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text; //텍스트
  final Color bgColor; //배경 색상
  final Color textColor; //텍스트 색상

  const Button(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    //html의 div같은 요소 -> container
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        color: bgColor,
      ),
      child: Padding(
        //패딩을 추가함. (버튼 처럼 보이게 하려고)
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 40,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
