import 'package:flutter/material.dart';

Widget crearBoton(widht, height, textButton, context, Function() state, Function(BuildContext context) login) {
  return Container(
    width: double.parse(widht.toString()),
    height: double.parse(height.toString()),
    child: RaisedButton(
        textColor: Colors.white,
        color: Color.fromRGBO(195, 16, 16, 1),
        child: Container(
          child: Text(textButton, style: TextStyle(fontSize: 16)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        onPressed: (){
          //state();
          //login(context);
        }
    ),
  );
}