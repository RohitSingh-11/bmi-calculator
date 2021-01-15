import 'dart:math';

class CalculatorBrain
{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;

  double _bmi;

  String calculateBmi()
  {
    _bmi = weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult()
  {
    if(_bmi >= 30.0)
    {
      return 'Obese';
    }
    else if(_bmi >= 25)
    {
      return 'Over Weight';
    }
    else if(_bmi >= 18.5)
    {
      return 'Normal Weight';
    }
    else
    {
      return 'Under Weight';
    }
  }
  String getInterpretation()
  {
    if(_bmi >= 30.0)
    {
      return 'you have a high obesity level , do more exercise';
    }
    else if(_bmi >= 25)
    {
      return 'your body weight is more than normal body weight';
    }
    else if(_bmi >= 18.5)
    {
      return 'you have a normal body weight';
    }
    else
    {
      return 'you are Under Weight , have some heavy diet!!';
    }
  }
}