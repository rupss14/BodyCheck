import 'package:flutter/material.dart';
import 'constants.dart';


class BottomButton extends StatelessWidget {
  BottomButton({this.onTap,required this.buttonText});
  final VoidCallback? onTap;
  final String buttonText;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttonText,
            style:klastButtonColor,
          ),
        ),
        color: kColorBottom,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContHeight,
      ),
    );
  }
}
