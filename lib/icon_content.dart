import 'package:flutter/material.dart';

class IconContentWidget extends StatelessWidget
{
  IconContentWidget({this.icon,this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context)
  {
    return Column
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Icon(icon,size: 80.0,),
        SizedBox
        (
          height: 5.0,
        ),
        Text
        (
          label,
          style: TextStyle
          (
            fontSize: 20.0,
          ),
        )
      ],
    );
  }
}