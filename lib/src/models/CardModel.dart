import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardModel extends StatelessWidget {
  final Map _c;
  CardModel(this._c);

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