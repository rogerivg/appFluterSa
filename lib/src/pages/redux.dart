import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:nima/nima_actor.dart';

class ReduxPage extends StatefulWidget {

  @override
  _ReduxPageState createState() => _ReduxPageState();
}

class _ReduxPageState extends State<ReduxPage> {
  final formKey = GlobalKey<FormState>();
  String _animationName = "idle";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Redux"),
        backgroundColor: Color.fromRGBO(195, 16, 16, 1),
        actions: <Widget>[
          Image.asset('icons/accenture.png', height: 20, width: 20),
        ],
      ),
      body: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: NimaActor("images/nima/Hop.nima",
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.contain,
                          animation: _animationName,
                          mixSeconds: 0.5, completed: (String animationName) {
                            setState(() {
                              // Return to idle.
                              _animationName = "idle";
                            });
                          })
                  ),
                  Positioned.fill(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(0),
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.vertical(),
                                      boxShadow: [
                                        BoxShadow(blurRadius: 7.0, color: Colors.black)
                                      ]
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text('Que es?',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.left,),
                                        subtitle: Text('Redux es un patrón de arquitectura que permite manejar el estado de la aplicación de una manera predecible. Está pensado para reducir el número de relaciones entre componentes de la aplicación y mantener un flujo de datos sencillo.', style: TextStyle(fontSize: 17, color: Colors.black), textAlign: TextAlign.justify),
                                      )
                                    ],
                                  ),
                                  width: size.width,
                                  height: 180,
                                ),
                                SizedBox(
                                  height: 25.0,
                                  width: 150.0,
                                ),
                                SizedBox(
                                    height: 180.0,
                                    width: 400.0,
                                    child: Carousel(
                                      autoplay: false,
                                      images: [
                                        Image.asset("images/redux.png", width: 390),
                                        Image.asset("images/reduxMiddleware.png", width: 399),
                                      ],
                                    )
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                        margin: const EdgeInsets.all(5.0),
                                        child: RaisedButton(
                                            child: Text("Saltar"),
                                            textColor: Colors.white,
                                            color: Colors.red[900],
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(22),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _animationName = "jump";
                                              });
                                            })
                                    ),
                                    Container(
                                        margin: const EdgeInsets.all(5.0),
                                        child: RaisedButton(
                                            child: Text("Atacar"),
                                            textColor: Colors.white,
                                            color: Colors.red[900],
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(22),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _animationName = "attack";
                                              });
                                            })
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  )
                ]
            )
      );
  }
}
