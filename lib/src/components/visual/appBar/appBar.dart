import 'package:apppocsa/src/components/visual/appBar/curvePainter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget crearAppBarLogin(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final fondoRed = Container(
    height: size.height*0.3,
    width: double.infinity,
    decoration: BoxDecoration(
      //color: Colors.red[900],
      gradient: LinearGradient(
          colors: <Color>[
            //Color.fromRGBO(102, 8, 8, 1.0),
            //Color.fromRGBO(204, 16, 16, 1.0)
            Colors.red,
            Colors.black
          ]
      ),
    ),
    child: CustomPaint(
      painter: CurvePainter(),
    ),
  );

  return Stack(
    children: <Widget>[
      fondoRed,
      Container(
        padding: EdgeInsets.only(top: 45),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10, width: double.infinity),
            Icon(Icons.cloud, color: Colors.white,),
            //SvgPicture.asset('images/LogoDavi.svg',height: 80, width: 80),
          ],
        ),
      ),
    ],
  );
}