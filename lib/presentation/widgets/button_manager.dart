import 'package:algoriza_intern_task1/presentation/widgets/text_manager.dart';
import 'package:flutter/material.dart';

class ButtonManager extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textFontSize;
  final FontWeight textFontWeight;
  final Color buttonColor;
  final double buttonPadding;
  final double buttonRadius;
  final Function function;

  const ButtonManager(
      {
        Key? key,
        required this.text,
        required this.textColor,
        required this.textFontSize,
        this.textFontWeight=FontWeight.normal,
        required this.buttonColor,
        this.buttonPadding=10,
        required this.buttonRadius,
        required this.function
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius)
        ),
        padding:  EdgeInsets.symmetric(
            vertical: buttonPadding
        ),
        color: buttonColor,
        onPressed:(){
           function();
        },
        child: TextManager(text:text ,color:textColor ,fontSize:textFontSize,fontWeight: textFontWeight,)
      ),
    );
  }
}
