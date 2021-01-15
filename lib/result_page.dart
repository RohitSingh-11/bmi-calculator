import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class ResultPage extends StatelessWidget
{
  ResultPage({@required this.interpretation,@required this.bmiResult,@required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Center(child: Text('BMI Calculator',style: TextStyle
        (
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
        ),)),
      ),
      body: Column
      (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
        [
          Expanded
          (
            child: Container
            (
              child: Center(
                child: Text
                  (
                  'RESULT',
                  style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Expanded
            (
            flex: 5,
            child: ReuseableCard
              (
              colour: Colors.black,
              cardChild: Column
                (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
                  Text(resultText.toUpperCase(),style: kResultTextStyle,),
                  Text
                    (
                    bmiResult,
                    style: kBmiTextStyle,
                  ),
                  Text(interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,),
                  Text('UnderWeight BMI Range',style: TextStyle(color: Colors.white30,fontSize: 20.0),),
                  Text('< 18.5 Kg/m2',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  Text('Normal BMI Range',style: TextStyle(color: Colors.white30,fontSize: 20.0),),
                  Text('18.5 - 25.0 Kg/m2',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  Text('OverWeight BMI Range',style: TextStyle(color: Colors.white30,fontSize: 20.0),),
                  Text('25.0 - 30.0 Kg/m2',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  Text('Obese BMI Range',style: TextStyle(color: Colors.white30,fontSize: 20.0),),
                  Text('> 30.0 Kg/m2',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE',
          onTap: (){
            Navigator.pop(context);
          },)
        ],
      )
    );
  }
}
