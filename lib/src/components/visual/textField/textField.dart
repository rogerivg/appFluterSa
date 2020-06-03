import 'package:flutter/material.dart';

Widget crearTextField(controller, hintText, icon, Function(String info) param) {
  //print(param);
  return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 328.0,
              height: 40,
              child: TextField(
                  controller: controller,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(250, 250, 252, 1),
                      prefixIcon: Icon(icon, color: Colors.red),
                      hintText: hintText,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(235, 236, 240, 1)),
                        borderRadius: BorderRadius.circular(25.7),
                      )
                  ),
                  onChanged: (value){
                    param(value);
                  }
              ),
            )
        );
      });
}