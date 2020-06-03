
import 'package:apppocsa/src/utils/Consts.dart';
import 'package:flutter/material.dart';



class TrabajarContigoPage extends StatefulWidget {

  @override
  _TrabajarContigoPageState createState() => _TrabajarContigoPageState();
}

class _TrabajarContigoPageState extends State<TrabajarContigoPage> {
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
        body: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: Consts.avatarRadius + Consts.padding,
                      bottom: Consts.padding,
                      left: Consts.padding,
                      right: Consts.padding,
                    ),
                    margin: EdgeInsets.only(top: Consts.avatarRadius),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(Consts.padding),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: const Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // To make the card compact
                      children: <Widget>[
                        Image.asset('images/ConNosotros.png', height: 350, width: 350),
                        SizedBox(height: 36.0),
                        Text(
                          'Esta Historia',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: RaisedButton(
                              textColor: Colors.white,
                              color: Color.fromRGBO(195, 16, 16, 1),
                              child: Container(
                                child: Text('Continuará...', style: TextStyle(fontSize: 16)),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              onPressed: (){
                                Navigator.of(context).pop(); // To close the dialog
                              }
                          ),
                        ),
                      ],
                    ),
                  ),//...bottom card part,

                  Positioned(
                    left: Consts.padding,
                    right: Consts.padding,
                    child: CircleAvatar(
                      backgroundColor: Colors.white, //fromARGB(204, 16 ,16,1),
                      radius: 60.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset('icons/accenture.png',height: 50, width: 50),
                        ],
                      ),
                    ),
                  ),//...top circlular image part,
                ],
        )
    );
  }
}
