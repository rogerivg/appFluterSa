import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:slimy_card/slimy_card.dart';

class UserNuevo extends StatefulWidget {

  @override
  _UserNuevoState createState() => _UserNuevoState();
}

class _UserNuevoState extends State<UserNuevo> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(195, 16, 16, 1),
        actions: <Widget>[
          Image.asset('icons/accenture.png', height: 20, width: 20),
        ],
      ),
      body: StreamBuilder(
        // This streamBuilder reads the real-time status of SlimyCard.
        initialData: false,
        stream: slimyCard.stream, //Stream of SlimyCard
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 100),
              // SlimyCard is being called here.
              SlimyCard(
                color: Color.fromRGBO(195, 16, 16, 1),
                width: 400,
                topCardHeight: 300,
                bottomCardHeight: 200,
                borderRadius: 20,
                // In topCardWidget below, imagePath changes according to the
                // status of the SlimyCard(snapshot.data).
                topCardWidget: topCardWidget((snapshot.data)
                    ? 'images/aggresive.jpg'
                    : 'images/calm.jpg'),
                bottomCardWidget: bottomCardWidget(),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Image.asset("images/IconDav.png", height: 40),
            IconButton(icon: Icon(MdiIcons.homeCircle, size: 30.0,),color: Color.fromRGBO(195, 16, 16, 1),  onPressed: () {}),
            IconButton(icon: Icon(MdiIcons.phone, size: 30.0,),color: Color.fromRGBO(195, 16, 16, 1), onPressed: () {},),
            IconButton(icon: Icon(MdiIcons.contacts, size: 30.0,),color: Color.fromRGBO(195, 16, 16, 1), onPressed: () {},),
            IconButton(icon: Icon(MdiIcons.incognito, size: 30.0,),color: Color.fromRGBO(195, 16, 16, 1),  onPressed: () {},),
            IconButton(icon: Icon(MdiIcons.settings, size: 30.0,),color: Color.fromRGBO(195, 16, 16, 1), onPressed: () {},),
       ],
        ),
        color: Colors.white,
      ),
    );
  }
// This widget will be passed as Top Card's Widget.
Widget topCardWidget(String imagePath) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: AssetImage(imagePath)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
      ),
      SizedBox(height: 15),
      Text(
        'Soy tu Asesor Virtual ',
        style: TextStyle(color: Colors.white, fontSize: 25), textAlign: TextAlign.center,
      ),
      SizedBox(height: 15),
      Text(
        '¿ Necesitas Ayuda, será que estas en el lugar equivocado ... ?',
        style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 18,
            fontWeight: FontWeight.w500), textAlign: TextAlign.center,
      ),
      SizedBox(height: 10),
    ],
  );
}

// This widget will be passed as Bottom Card's Widget.
Widget bottomCardWidget() {
  return Text(
    'No te preocupes... \nPor favor Contáctanos \n y abre un Producto con Nosotros.',
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    textAlign: TextAlign.center,
  );
}




}

