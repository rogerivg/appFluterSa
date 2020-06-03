import 'package:apppocsa/src/actions/appActions.dart';
import 'package:apppocsa/src/actions/loginActions.dart';
import 'package:apppocsa/src/actions/usuarioActions.dart';
import 'package:apppocsa/src/components/visual/appBar/appBar.dart';
import 'package:apppocsa/src/components/visual/button/CustomDialog.dart';
import 'package:apppocsa/src/components/visual/textField/textField.dart';
import 'package:apppocsa/src/models/app_state.dart';
import 'package:apppocsa/src/models/loginModel.dart';
import 'package:apppocsa/src/models/usuarioModel.dart';
import 'package:apppocsa/src/providers/loginProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:redux/redux.dart';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();

}
class _LoginPageState extends State<LoginPage> {
  final loginProvider = new LoginProvider();
  final documentController = TextEditingController();
  final passwordController = TextEditingController();
  String document = "";
  String password = "";

  bool _isInAsyncCall = false;
  Store<AppState> store;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 236, 240, 1),
      //backgroundColor: Colors.black,
      body: ModalProgressHUD(
        child: Stack(
          children: <Widget>[
            crearAppBarLogin(context),
            _loginForm(context),
          ],
        ),
        inAsyncCall: _isInAsyncCall,
      ),
      floatingActionButton: Align(
        child: _crearBotonHelp(context),
        alignment: Alignment(0.85, -0.6),
      ),
    );
  }

  Widget _loginForm(context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
                height: 180,
              )
          ),
          Container(
            width: size.width*0.85,
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
              color: Color.fromRGBO(235, 236, 240, 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Text('Número de documento'),
                SizedBox(height: 10),
                //_crearNumDoc(),
                crearTextField(documentController, 'Cédula de ciudadania', Icons.person, onChangedDocument),
                SizedBox(height: 30),
                Text('Contraseña'),
                SizedBox(height: 10),
                crearTextField(passwordController, 'Contraseña', Icons.lock, onChangedPassword),
                SizedBox(height: 5),
                Text('¿Olvidó o bloqueó su clave?'),
                SizedBox(height: 30),
                _crearBoton(context),
                //crearBoton(148, 48, 'Ingresar', context, setStateTrue , _login(context))
              ],
            ),
          ),
          Text('Términos y condiciones')
        ],
      ),
    );
  }


  Widget _crearBoton(context) {
          return Container(
            width: 148,
            height: 48,
            child: RaisedButton(
                textColor: Colors.white,
                color: Color.fromRGBO(195, 16, 16, 1),
                child: Container(
                  child: Text('Ingresar', style: TextStyle(fontSize: 16)),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                onPressed: (){
                  setState(() {
                    _isInAsyncCall = true;
                  });
                  _login(context);
                }
            ),
          );
  }

  _crearBotonHelp(BuildContext context) {

    return Container(
      height: 40.0,
      width: 40.0,
      child: FittedBox(
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 16,
            color: Colors.black,
          ),
          backgroundColor: Color.fromRGBO(235, 236, 240, 1),
          onPressed: ()=>Navigator.pushNamed(context, 'eresnuevo'),
        )
      ),
    );
  }

  _login (BuildContext context){
    print("ahora esta esta info ?==== "+ StoreProvider.of<AppState>(context).state.loginModel.toString());

    final userLogin = loginProvider.cargarLogin(StoreProvider.of<AppState>(context).state.loginModel.numDocument, StoreProvider.of<AppState>(context).state.loginModel.password)
        .then((value){
          print(value);
          StoreProvider.of<AppState>(context).dispatch(AppAction(true));
          StoreProvider.of<AppState>(context).dispatch(UsuarioAction(UsuarioModel(numDocument: value.numDocument)));
          StoreProvider.of<AppState>(context).dispatch(UsuarioAction(UsuarioModel(userName: value.userName)));
         Navigator.pushReplacementNamed(context, 'homeClient');
        })
        .catchError((err){
          print("error");

          showDialog<void>(
            context: context,
            builder: (BuildContext context) => CustomDialog(
              title: "Login Inválido",
              description:
              "Valida tu número de Documento                 "
                  "y tu Clave.",
              buttonText: "Aceptar",
            ),
          );


          print("error");
          clearInfoLogin();
          setState(() {
            _isInAsyncCall = false;
          });
        });
  }
  clearInfoLogin(){
    documentController.clear();
    passwordController.clear();

  }

  onChangedPassword(param){
    StoreProvider.of<AppState>(context).dispatch(LoginAction(LoginModel(password: param, numDocument: StoreProvider.of<AppState>(context).state.loginModel.numDocument)));
  }

  onChangedDocument(param){
    StoreProvider.of<AppState>(context).dispatch(LoginAction(LoginModel(numDocument: param, password: StoreProvider.of<AppState>(context).state.loginModel.password)));
  }

  setStateTrue(){
    setState(() {
      _isInAsyncCall = true;
    });
  }


}