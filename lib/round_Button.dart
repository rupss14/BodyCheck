import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  RoundButton({required this.icon,required this.onPressed})  ;
  final VoidCallback? onPressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon),
      onPressed:onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor:Color(0xFF4C4F5E) ,
    );

  }
}
