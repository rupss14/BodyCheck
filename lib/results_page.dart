import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'bottomButton.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmi,required this.bmiText,required this.bmiAdvice});
final String bmi;
final String bmiText;
final String bmiAdvice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text(
          'BMI CALCULATOR',
        ),),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kResultText,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActivecolor,
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    Text(
                      bmiText,
                      style: kBodyResultstyle,
                    ),
                    Text(
                      bmi,
                      style: kNumResultstyle,
                    ),
                    Text(
                      bmiAdvice,
                      style:kBodyTextResult ,
                      textAlign: TextAlign.center,
                    )
                  ],
                ) ,
              ),
            ),
            BottomButton(
              buttonText: 'RECALCULATE',
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
    );
  }
}
