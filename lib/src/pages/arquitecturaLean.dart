import 'package:apppocsa/src/pages/cloudComponents.dart';
import 'package:apppocsa/src/pages/otherComponents.dart';
import 'package:flutter/material.dart';


class ArquitecturaLean extends StatefulWidget {

  @override
  _ArquitecturaLeanState createState() => _ArquitecturaLeanState();
}

class _ArquitecturaLeanState extends State<ArquitecturaLean> {
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
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/arquitectura1.png'),
              Text(
                'ARQUITECTURA',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 40.0,
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Desarrollo Mobile',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.deepOrange,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.red[900],
                ),
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: InkWell(
                      splashColor: Colors.red[900],
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CloudComponentsPage()),);
                      },
                  child: ListTile(
                    leading: Icon(
                      Icons.cloud_done,
                      color: Colors.red[900],
                      size: 30.0,
                    ),
                    title: Text(
                      'Componentes Cloud',
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                )
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: InkWell(
                    splashColor: Colors.red[900],
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OtherComponentsPage()),);
                    },
                  child: ListTile(
                    leading: Icon(
                      Icons.touch_app,
                      color: Colors.red[900],
                      size: 30.0,
                    ),
                    title: Text(
                      'Componentes App',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Source Sans Pro'),
                    ),
                  )
                )
              )
            ],
          ),
      ),
    );

  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SlimyCard(
            color: Colors.red,
            width: 200,
            topCardHeight: 400,
            bottomCardHeight: 200,
            borderRadius: 15,
            topCardWidget: myWidget01('images/arquitectura1.png'),
            bottomCardWidget: myWidget02(),
            slimeEnabled: true,
          ),
        ],
      ),
    );
  }

// This widget will be passed as Top Card's Widget.
  Widget myWidget01(String imagePath) {
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
          'The Rock',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 15),
        Text(
          'He asks, what your name is. But!',
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget myWidget02() {
    return Text(
      'It doesn\'t matter \nwhat your name is.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
*/
}