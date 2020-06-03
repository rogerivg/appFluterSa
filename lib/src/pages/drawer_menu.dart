import 'package:apppocsa/src/pages/arquitecturaLean.dart';
import 'package:apppocsa/src/pages/redux.dart';
import 'package:apppocsa/src/pages/trabajarContigo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const kTitle = 'Super App';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          //SvgPicture.asset('images/LogoDavi.svg',height: 80, width: 80),
          DrawerHeader(

            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10, width: double.infinity),
                  Icon(Icons.cloud,color: Colors.white,)
                  //SvgPicture.asset('images/LogoDavi.svg',height: 80, width: 80),
                ],
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(102, 8, 8, 1.0),
                  Color.fromRGBO(204, 16, 16, 1.0)
                ]
              ),
            ),
          ),
          getListTile('Arquitectura', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ArquitecturaLean()),);
          }),
          getLine(),
          getListTile('Redux', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ReduxPage()),);
          }),
          getLine(),
          getListTile('Cuenta con Nosotros', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TrabajarContigoPage()),);
          }),
          getLine(),
        ],
      ),
    );
  }

  Widget getLine() {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget getListTile(title, {Function onTap}) {
    return ListTile(
      title: Text(title,  style: TextStyle(
       color: Colors.black, fontWeight: FontWeight.bold,
      ),),
      onTap: onTap,
    );
  }

//  Function gotoScreen(BuildContext context, String name) {
//    if (name == 'home') {
//      Navigator.pushNamed(context, '/');
//    } else if (name == 'about') {
//      Navigator.pushNamed(context, '/about');
//    } else if (name == 'settings') {
//      Navigator.pushNamed(context, '/settings');
//    }
//  }
}
