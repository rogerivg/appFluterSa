import 'package:apppocsa/src/actions/usuarioActions.dart';
import 'package:apppocsa/src/models/app_state.dart';
import 'package:apppocsa/src/models/loginModel.dart';
import 'package:apppocsa/src/models/models.dart';
import 'package:apppocsa/src/reducers/usuario/usuarioActionReducer.dart';

LoginModel loginReducer(LoginModel state, action) {
  return LoginModel(
    //reduxSetup: testReducer(state.reduxSetup, action),
    //numDocument: usuReducer(state.numDocument, action)
  );
}