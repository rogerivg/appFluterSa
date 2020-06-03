import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:card_selector/card_selector.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    var t = Theme.of(c)
        .textTheme
        .apply(displayColor: Colors.black26, bodyColor: Colors.black26);
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light, textTheme: t),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HState createState() => _HState();
}

class _HState extends State<Home> {
  List _cs;
  Map _c;
  double _w = 0;

  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context).loadString("lib/src/utils/in.json").then((d) {
      _cs = json.decode(d);
      setState(() => _c = _cs[0]);
    });
  }

  @override
  Widget build(BuildContext c) {
    if (_cs == null) return Container();
    if (_w <= 0) _w = MediaQuery.of(context).size.width - 40.0;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                "Arquitectura",
                style: Theme.of(c)
                    .textTheme
                    .display3
                    .copyWith(fontFamily: 'rms', color: Colors.black),
              ),
            ),
            //SizedBox(height: 1.0),
            CardSelector(
                cards: _cs.map((c) => Card(c)).toList(),
                mainCardWidth: _w,
                mainCardHeight: _w * 0.73,
                mainCardPadding: -16.0,
                onChanged: (i) => setState(() => _c = _cs[i])),
            Expanded(child: Amounts(_c)),
          ],
        ),
      ),
    );
  }
}

class Amounts extends StatelessWidget {
  final Map _c;

  Amounts(this._c);

  @override
  Widget build(BuildContext cx) {
    var tt = Theme.of(cx).textTheme;
    var pd = EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: (_c['tx'] as List).length + 1,
      itemBuilder: (c, i) {
        if (i == 0) {
          return Padding(
            padding: pd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Balance', style: tt.caption.apply(color: Colors.black)),
                SizedBox(height: 8.0),
                Text(_c['bl'], style: tt.display1.apply(color: Colors.black)),
                SizedBox(height: 24.0),
                Text('Today', style: tt.caption.apply(color: Colors.black)),
              ],
            ),
          );
        }
        var tx = _c['tx'][i - 1];
        return Padding(
          padding: pd,
          child: Row(
            children: <Widget>[
              Icon(MdiIcons.fromString(tx['i']),
                  size: 25.0, color: Colors.red[900]),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(tx['m'], style: tt.title.apply(color: Colors.black)),
                    Text(tx['t'], style: tt.caption.apply(color: Colors.black))
                  ],
                ),
              ),
              Text(tx['a'], style: tt.body2.apply(color: Colors.red[900]))
            ],
          ),
        );
      },
    );
  }
}

class Card extends StatelessWidget {
  final Map _c;
  Card(this._c);

  @override
  Widget build(BuildContext context) {
    var tt = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        color: Color(_c['co']),
        child: Stack(
          children: <Widget>[
            Image.asset(
              'images/${_c['txt']}.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: Container())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}