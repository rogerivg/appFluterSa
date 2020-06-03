import 'package:apppocsa/src/models/app_state.dart';
import 'package:apppocsa/src/pages/misCreditos.dart';
import 'package:apppocsa/src/pages/misCuentas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'drawer_menu.dart';

class HomeClientPage extends StatefulWidget {

  @override
  _HomeClientPageState createState() => _HomeClientPageState();
}

class _HomeClientPageState extends State<HomeClientPage> {
  final formKey = GlobalKey<FormState>();
  bool _isInAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(195, 16, 16, 1),
        title: Text(StoreProvider.of<AppState>(context).state.usuarioModel.userName),
        actions: <Widget>[
          Image.asset('icons/accenture.png', height: 20, width: 20),
        ],
      ),
      backgroundColor: Color.fromRGBO(235, 236, 240, 1),
      body: ModalProgressHUD(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child:Column(
              children: [
                  new Image.asset("images/MisCuentas1.png"),
                Row(
                    children: [

                    ]
                ),
                Row(
                  children: <Widget>[
                    //Container(child: Image.asset("images/borde.png",width: 20,),),
                    Container(
                      child: Image.asset("images/MisCreditos1.png",width: 370,),
                    )
                  ],
                ),
                //new Image.asset("images/detalleDav.png"),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: <Widget>[
                          //new Image.asset("images/martesAlitas.png", height: 170),
                          //new Image.asset("images/mesAhorro.png", height: 170),
                          //new Image.asset("images/martesAlitas.png", height: 170),
                          //new Image.asset("images/mesAhorro.png", height: 170),
                        ]
                    )
                )
                ]
              )
            ),
          ],
        ),
        inAsyncCall: _isInAsyncCall,
      ),
      floatingActionButton: Align(
        alignment: Alignment(0.85, -0.6),
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(MdiIcons.homeCircle, size: 30.0,),color: Color.fromRGBO(195, 16, 16, 1),  onPressed: () {}),
            IconButton(icon: Icon(MdiIcons.cardBulleted, size: 30.0,),color: Color.fromRGBO(195, 16, 16, 1), onPressed: () {},),
            IconButton(icon: Icon(MdiIcons.shopify, size: 30.0,),color: Color.fromRGBO(195, 16, 16, 1), onPressed: () {},),
            IconButton(icon: Icon(MdiIcons.send, size: 30.0,),color: Color.fromRGBO(195, 16, 16, 1),  onPressed: () {},),
            IconButton(icon: Icon(MdiIcons.settings, size: 30.0,),color: Color.fromRGBO(195, 16, 16, 1), onPressed: () {},),
            ],
        ),
        color: Color.fromRGBO(235, 236, 240, 1),
      ),
    );
  }
}
