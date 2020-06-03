import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AmountsModel extends StatelessWidget {
  final Map _c;
  AmountsModel(this._c);

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
                SizedBox(height: 8.0),
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
                  size: 30.0, color: Color.fromRGBO(195, 16, 16, 1)),
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
              Text(tx['a'], style: tt.body2.apply(color: Colors.deepOrange))
            ],
          ),
        );
      },
    );
  }
}