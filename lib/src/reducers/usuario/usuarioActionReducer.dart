
import 'package:apppocsa/src/actions/usuarioActions.dart';
import 'package:apppocsa/src/models/usuarioModel.dart';
import 'package:redux/redux.dart';

final usuReducer = TypedReducer<UsuarioModel, UsuarioAction>(_usuActionReducer);

UsuarioModel _usuActionReducer(UsuarioModel state, UsuarioAction action) {
  return action.usuarioPayload;
}