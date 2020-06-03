import 'package:apppocsa/src/models/AmountsModel.dart';
import 'package:apppocsa/src/models/CardModel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:card_selector/card_selector.dart';

class MisCreditosPage extends StatefulWidget {

  @override
  _MisCreditosPageState createState() => _MisCreditosPageState();
}

class _MisCreditosPageState extends State<MisCreditosPage> {
  List _cs;
  Map _c;
  double _w = 0;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context).loadString("lib/src/utils/in.json").then((d) {
      _cs = json.decode(d);
      setState(() => _c = _cs[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cs == null) return Container();
    if (_w <= 0) _w = MediaQuery.of(context).size.width - 40.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(195, 16, 16, 1),
        actions: <Widget>[
          Image.asset('icons/accenture.png', height: 20, width: 20),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 25.0,
              width: 150.0,
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Text(
                "Mis Créditos",
                style: TextStyle(fontFamily: 'LBF', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.left,),
            ),
            SizedBox(
              height: 25.0,
              width: 150.0,
            ),
            CardSelector(
                cards: _cs.map((c) => CardModel(c)).toList(),
                mainCardWidth: _w,
                mainCardHeight: _w * 0.63,
                mainCardPadding: -16.0,
                onChanged: (i) => setState(() => _c = _cs[i])),
            Expanded(child: AmountsModel(_c)),
          ],
        ),
      ),
    );
  }
}
