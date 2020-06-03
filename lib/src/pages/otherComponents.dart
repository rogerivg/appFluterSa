import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OtherComponentsPage extends StatefulWidget {

  @override
  _OtherComponentsPageState createState() => _OtherComponentsPageState();
}

class _OtherComponentsPageState extends State<OtherComponentsPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Componentes App"),
          backgroundColor: Color.fromRGBO(195, 16, 16, 1),
          actions: <Widget>[
            Image.asset('icons/accenture.png', height: 20, width: 20),
          ],
        ),
        body: SafeArea(

          child:
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(80),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 1,
              children: <Widget>[

                Container(
                  child:
                  const ListTile(contentPadding: const EdgeInsets.all(10),
                    title: Text('View',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.left,),
                    subtitle: Text('Uso y definición de los componentes en la capa de presentación.', style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.left),
                    leading: Icon(MdiIcons.viewModule,
                      size: 50.0, color: Colors.white,),
                  ),
                  decoration: new BoxDecoration(
                    color: Color.fromRGBO(176, 22, 22, 1),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                Container(
                  child:
                  const ListTile(contentPadding: const EdgeInsets.all(10),
                    title: Text('Action',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.left,),
                    subtitle: Text('Es el componente y unica fuente de información para la store, describen que algo paso en la aplicación.', style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.left),
                    leading: Icon(MdiIcons.run,
                      size: 50.0, color: Colors.white,),
                  ),
                  decoration: new BoxDecoration(
                    color: Color.fromRGBO(192, 38, 38, 1),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                Container(
                  child:
                  const ListTile(contentPadding: const EdgeInsets.all(10),
                    title: Text('Middleware',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.left,),
                    subtitle: Text('Permite obtener el registro de eventos, informes de fallos, hacer llamados a API y prestar servicios de enrutamiento', style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.left),
                    leading: Icon(MdiIcons.midiPort,
                      size: 50.0, color: Colors.white,),
                  ),
                  decoration: new BoxDecoration(
                    color: Color.fromRGBO(198, 44, 44, 1),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                Container(
                  child:
                  const ListTile(contentPadding: const EdgeInsets.all(10),
                    title: Text('Reducer',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.left,),
                    subtitle: Text('Especifica el cambio de la aplicacion en respuesta a la acción', style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.left),
                    leading: Icon(MdiIcons.keyChange,
                      size: 50.0, color: Colors.white,),
                  ),
                  decoration: new BoxDecoration(
                    color: Color.fromRGBO(207, 53, 53, 1),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                Container(
                  child:
                  const ListTile(contentPadding: const EdgeInsets.all(10),
                    title: Text('Store',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.left,),
                    subtitle: Text('Contiene todo el arbol de estado de la aplicación, la unfica forma de cambiar un estado es a traves de una acción.', style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.left),
                    leading: Icon(MdiIcons.store,
                      size: 50.0, color: Colors.white,),
                  ),
                  decoration: new BoxDecoration(
                    color: Color.fromRGBO(217, 63, 63, 1),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ],
            )
        )
    );
  }
}
