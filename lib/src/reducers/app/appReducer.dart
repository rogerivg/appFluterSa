import 'package:apppocsa/src/actions/usuarioActions.dart';
import 'package:apppocsa/src/models/app_state.dart';
import 'package:apppocsa/src/reducers/login/loginActionReducer.dart';
import 'package:apppocsa/src/reducers/usuario/usuarioActionReducer.dart';
import 'package:apppocsa/src/reducers/app/appActionReducer.dart';


AppState appReducer(AppState state, action) {
  return AppState(
    reduxSetup: AppReducer(state.reduxSetup, action),
    usuarioModel: usuReducer(state.usuarioModel, action),
    loginModel: loginReducer(state.loginModel, action)
  );
}