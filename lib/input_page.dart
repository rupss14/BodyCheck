import 'package:bmi_calculator/calculator_brains.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottomButton.dart';
import 'round_Button.dart';
import 'calculator_brains.dart';
enum Gender{
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height=180;
  int weight =50;
  int age=19;
 /* Color maleCardColor=inactivecolor;
  Color femaleCardColor=inactivecolor;
  //1=male,2=female
  void updateColor(Gender selectedgender){
    //male card pressed
    if(selectedgender==Gender.male){
      if(maleCardColor==inactivecolor){
        maleCardColor=activecolor;
        femaleCardColor=inactivecolor;
      }
      else{
        maleCardColor=inactivecolor;
      }
    }
    //female card pressed
    if(selectedgender==Gender.female){
      if(femaleCardColor==inactivecolor){
        femaleCardColor=activecolor;
        maleCardColor=inactivecolor;
      }
      else{
        femaleCardColor=inactivecolor;
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  },
                  cardChild: IconsContent(
                    icon:FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                  colour:selectedGender==Gender.male? kActivecolor : kInactivecolor,
                ),
              ),
              Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    cardChild: IconsContent(
                      icon:FontAwesomeIcons.venus,
                      text:'FEMALE',
                    ),
                colour: selectedGender==Gender.female? kActivecolor : kInactivecolor,
              )),
            ],
          )),
          Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children:<Widget> [
                    Text(
                      'HEIGHT',
                      style:kTextstyle ,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline:TextBaseline.alphabetic,
                      children:<Widget> [
                        Text(
                          height.toString(),
                          style: kcardNumSize,
                        ),
                        Text(
                          'cm',
                          style: kTextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data:SliderThemeData(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor:Color(0x29EB1555) ,
                        thumbShape:RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),

                   ),
                      child: Slider(
                          value:height.toDouble(),
                          min:120.0,
                          max:220.0,
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged:(double newValue){
                            setState(() {
                              height=newValue.round();
                            });
                          } ,
                      ),
                    )
                  ],
                ),
            colour: kActivecolor,
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                colour: kActivecolor,
                    cardChild: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children:<Widget> [
                        Text(
                            'WEIGHT',
                          style:kTextstyle,
                     )   ,
                        Text(
                            weight.toString(),
                        style: kcardNumSize,
                        ) ,
                        Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children:<Widget> [
                            RoundButton(
                              icon:FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                               SizedBox(width: 10.0,),
                             RoundButton(
                               icon: FontAwesomeIcons.plus,
                               onPressed: (){
                                 setState(() {
                                   weight++;
                                 });
                               },
                             ),
                    ],
                        ),
                      ],
                    ) ,
              ),
              ),
              Expanded(
                  child: ReusableCard(
                colour: kActivecolor,
                   cardChild: Column(
                     mainAxisAlignment:MainAxisAlignment.center,
                     children:<Widget> [
                       Text(
                           'AGE',
                         style:kTextstyle,
                    )   ,
                       Text(
                           age.toString(),
                       style: kcardNumSize,
                       ) ,
                       Row(
                         mainAxisAlignment:MainAxisAlignment.center,
                         children:<Widget> [
                           RoundButton(
                             icon:FontAwesomeIcons.minus,
                             onPressed: (){
                               setState(() {
                                 age--;
                               });
                             },
                           ),
                              SizedBox(width: 10.0,),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                   ],
                       ),
                     ],
                   ) ,
                    ),
              ),
            ],
          )),
          BottomButton(
            onTap: (){
              CalculatorBrain calc=CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>ResultPage(
                    bmi:calc.calBMI() ,
                    bmiText:calc.getResult(),
                    bmiAdvice: calc.getAdvice(),
                  ))
              );
            },
            buttonText: 'CALCULATE',
          )
        ]));
  }
}



