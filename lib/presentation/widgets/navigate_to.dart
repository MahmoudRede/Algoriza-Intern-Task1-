import 'package:flutter/material.dart';


Future navigateTo(Widget widget,context){
  return Navigator.push(context, MaterialPageRoute(builder: (_){
    return widget;
  }));
}

