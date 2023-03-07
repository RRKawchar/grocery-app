// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  Color? color;
  FontWeight? fontWeight;
  double size;
  List<Shadow>? shadow;
  int? maxLines;
  TextAlign? textAlign;
   TextWidget({Key? key, required this.text,this.color=Colors.black,this.size=15,this.fontWeight,this.shadow,this.maxLines,this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,textAlign:textAlign,maxLines:maxLines,style: TextStyle(fontSize: size,color: color,fontWeight: fontWeight,shadows: shadow));
  }
}
