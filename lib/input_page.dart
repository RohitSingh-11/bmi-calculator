import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';

enum Gender
{
  male,
  female,
}

class InputPage extends StatefulWidget
{
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>
{
     Gender selectedGender;
     int height = 170;
     int heightFeet = 5;
     int heightInch = 5;
     int weight = 58;
     int age = 24;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Center(child: Text('BMI Calculator',style: TextStyle(fontSize: 30.0),)),
      ),
      body: Column
      (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
        [
          Expanded(child: Row
          (
            children:
            [
              Expanded(child: GestureDetector
              (
                onTap: ()
                {
                  setState(()
                  {
                    selectedGender = Gender.male;
                  });
                },
                child: ReuseableCard
                (
                  colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  cardChild: IconContentWidget
                  (
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
              )
          ),
              Expanded(child: GestureDetector
              (
                onTap: ()
                {
                    setState(()
                    {
                      selectedGender = Gender.female;
                    });
                },
                child: ReuseableCard
                (
                  colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                  cardChild: IconContentWidget
                  (
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ),
              ),
            ],
          )
          ),
          Expanded(child: ReuseableCard
          (
            colour: kNormalCardColor,
            cardChild: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Text('HEIGHT',style: kFontStyle,),
                Row
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:
                  [
                    Text(heightFeet.toString(),style: kNumberTextStyle,),
                    Text('feet',style: kFontStyle,),
                    Text(heightInch.toString(),style: kNumberTextStyle,),
                    Text('inch',style: kFontStyle,),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith
                  (
                    //activeTrackColor: Colors.red,
                    thumbShape: RoundSliderThumbShape
                      (enabledThumbRadius: 10.0),
                    overlayShape: RoundSliderOverlayShape
                      (overlayRadius: 30.0)
                  ),
                  child: Slider
                  (
                      value: heightFeet.toDouble(),
                      min: 2.0,
                      max: 8.0,
                      activeColor: Colors.pink,
                      inactiveColor: Colors.white,
                      onChanged: (double newValue)
                      {
                        setState(() {
                          heightFeet = newValue.round();
                          height = ((heightFeet * 12 + heightInch) * 2.54).round();
                        });
                      },
                  ),
                ),
                Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ft',style: TextStyle(fontSize: 20.0),),
                        Icon(Icons.arrow_upward),
                        SizedBox(width: 40.0,),
                        Text('inch',style: TextStyle(fontSize: 20.0),),
                        Icon(Icons.arrow_downward),
                      ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith
                    (
                    //activeTrackColor: Colors.red,
                      thumbShape: RoundSliderThumbShape
                        (enabledThumbRadius: 10.0),
                      overlayShape: RoundSliderOverlayShape
                        (overlayRadius: 30.0)
                  ),
                  child: Slider
                    (
                    value: heightInch.toDouble(),
                    min: 0.0,
                    max: 11.0,
                    activeColor: Colors.pink,
                    inactiveColor: Colors.white,
                    onChanged: (double newValue)
                    {
                      setState(() {
                        heightInch = newValue.round();
                        height = ((heightFeet * 12 + heightInch) * 2.54).round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(child: Row
          (
            children:
            [
              Expanded(child: ReuseableCard
              (
                colour: kNormalCardColor,
                cardChild: Column
                  (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text('WEIGHT',style: kFontStyle,),
                    Text(weight.toString(),style: kNumberTextStyle,),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          RoundIconButton
                          (
                            icon: FontAwesomeIcons.minus,
                            onPressed: ()
                            {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0,),
                          RoundIconButton
                            (
                            icon: FontAwesomeIcons.plus,
                            onPressed: ()
                            {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                    )
                  ],
                ),
              )
              ),
              Expanded(child: ReuseableCard
              (
                colour: kNormalCardColor,
                cardChild: Column
                  (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text('AGE',style: kFontStyle,),
                    Text(age.toString(),style: kNumberTextStyle,),
                    Row
                      (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        RoundIconButton
                          (
                          icon: FontAwesomeIcons.minus,
                          onPressed: ()
                          {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0,),
                        RoundIconButton
                          (
                          icon: FontAwesomeIcons.plus,
                          onPressed: ()
                          {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
              ),
            ],
          )
          ),
          BottomButton(buttonTitle: 'CALCULATE',
          onTap: ()
          {
            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
              bmiResult: calc.calculateBmi(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));

          },)
        ],
      )
      // floatingActionButton: Theme(
      //   data: ThemeData(accentColor: Colors.blue),
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //   ),
      // )
    );
  }
}