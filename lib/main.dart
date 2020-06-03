import 'package:apppocsa/src/models/app_state.dart';
import 'package:apppocsa/src/models/loginModel.dart';
import 'package:apppocsa/src/pages/UserNuevo.dart';
import 'package:apppocsa/src/pages/arquitecturaLean.dart';
import 'package:apppocsa/src/pages/cloudComponents.dart';
import 'package:apppocsa/src/pages/home.dart';
import 'package:apppocsa/src/pages/homeClient.dart';
import 'package:apppocsa/src/pages/login.dart';
import 'package:apppocsa/src/pages/misCreditos.dart';
import 'package:apppocsa/src/pages/misCuentas.dart';
import 'package:apppocsa/src/pages/otherComponents.dart';
import 'package:apppocsa/src/pages/producto.dart';
import 'package:apppocsa/src/pages/redux.dart';
import 'package:apppocsa/src/pages/trabajarContigo.dart';
import 'package:apppocsa/src/reducers/app/appReducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {

  final store = Store<AppState>(
    appReducer,
    initialState: AppState(
        reduxSetup: false,
        loginModel: LoginModel(numDocument: "12313", password: "321321")
    ),
  );
  print('Initial state: ${store.state.reduxSetup}');

  runApp(StoreProvider(store: store, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context)=> LoginPage(),
        'home' : (BuildContext context)=> HomePage(),
        'producto' : (BuildContext context)=> ProductoPage(),
        'homeClient' : (BuildContext context)=> HomeClientPage(),
        'arquitectura' : (BuildContext context)=> ArquitecturaLean(),
        'redux' : (BuildContext context)=> ReduxPage(),
        'misCreditos' : (BuildContext context)=> MisCreditosPage(),
        'misCuentas' : (BuildContext context)=> MisCuentasPage(),
        'cloudComponents' : (BuildContext context)=> CloudComponentsPage(),
        'otherComponents' : (BuildContext context)=> OtherComponentsPage(),
        'trabajarContigo' : (BuildContext context)=> TrabajarContigoPage(),
        'eresnuevo' : (BuildContext context)=> UserNuevo(),
      },
    );
  }
}
