import 'package:apppocsa/src/components/visual/icons/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:photo_view/photo_view.dart';

class CloudComponentsPage extends StatefulWidget {

  @override
  _CloudComponentsPageState createState() => _CloudComponentsPageState();
}

class _CloudComponentsPageState extends State<CloudComponentsPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Componentes Cloud"),
          backgroundColor: Color.fromRGBO(195, 16, 16, 1),
          actions: <Widget>[
            Image.asset('icons/accenture.png', height: 20, width: 20),
          ],
        ),
      body: SafeArea(
        child: Column(

          children: <Widget>[
            SizedBox(
              height: 40.0,
              width: 150.0,
            ),
            Text(
              'Vista Arquitectura',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Color.fromRGBO(195, 16, 16, 1),
                fontSize: 25.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),

            Expanded(child: customPhoto(context)),
            //Image.asset('images/vistaArchitecture.jpeg'),
            SizedBox(
              height: 10.0,
              width: 150.0,
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(contentPadding: const EdgeInsets.all(10),
                      title: Text('Azure API Management',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.left,),
                      subtitle: Text('API Management permite publicar APIs, brindando las capacidades comunes de las APIs, con el fin de realizar su correcta gestión.', style: TextStyle(fontSize: 17, color: Colors.white), textAlign: TextAlign.left),
                      leading: Icon(MyFlutterApp.logoa_01,
                        size: 50.0, color: Colors.white,),
                    ),
              decoration: new BoxDecoration(
                color: Color.fromRGBO(195, 16, 16, 1),//Colors.orangeAccent[200],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(contentPadding: const EdgeInsets.all(10),
                title: Text('Azure Function',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.left,),
                subtitle: Text('Servicio Serverless que permite ejecutar código activado por eventos sin tener que aprovisionar o administrar explícitamente la infraestructura..', style: TextStyle(fontSize: 17, color: Colors.white), textAlign: TextAlign.left),
                leading: Icon(MyFlutterApp.logoa_02,
                  size: 50.0, color: Colors.white,),
              ),
              decoration: new BoxDecoration(
                color:  Color.fromRGBO(195, 16, 16, 1),//Colors.orangeAccent[200],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  customPhoto(BuildContext context){
    return Container(
        child: PhotoView(
          imageProvider: AssetImage("images/vistaArchitecture.jpeg"),
          //
            backgroundDecoration: BoxDecoration(color: Colors.white),
            gaplessPlayback: false,
            //customSize: MediaQuery.of(context).size,
            enableRotation: true,
            //minScale: PhotoViewComputedScale.contained * 0.8,
            //maxScale: PhotoViewComputedScale.covered * 1.8,
            initialScale: PhotoViewComputedScale.contained,
            basePosition: Alignment.center
            //
        )
    );
  }
}
