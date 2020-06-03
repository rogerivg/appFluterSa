
import 'package:apppocsa/src/actions/loginActions.dart';
import 'package:apppocsa/src/models/loginModel.dart';
import 'package:apppocsa/src/models/usuarioModel.dart';
import 'package:redux/redux.dart';

final loginReducer = TypedReducer<LoginModel, LoginAction>(_loginActionReducer);

LoginModel _loginActionReducer(LoginModel state, LoginAction action) {
  return action.loginPayload;
}