import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultText (
    {
      required String text,
      required double fontSize,
      required color,
      FontWeight? fontWeight

    }
    ){
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        color: color ,
        fontWeight:fontWeight
    ),
  );
}

Widget defaultTextFormField (
    {
      required TextEditingController controller,
      IconData? prefix,
      required hint,
       //Function(String?)? validator,
      TextInputType? textInputType
    }
    ){
  return  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.white,
    ),
    child: TextFormField(
      controller:controller ,
      decoration: InputDecoration(
          hintText: hint,
          border:InputBorder.none,
          prefixIcon: Icon(prefix)
      ),

      keyboardType:textInputType,
    ),
  );
}