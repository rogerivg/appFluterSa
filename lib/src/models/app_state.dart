import 'package:apppocsa/src/models/loginModel.dart';
import 'package:apppocsa/src/models/models.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final bool reduxSetup;
  final UsuarioModel usuarioModel;
  final LoginModel loginModel;

  const AppState({
    @required this.reduxSetup,
    @required this.usuarioModel,
    this.loginModel
  });

  AppState copyWith({
    bool reduxSetup,
    UsuarioModel usuarioModel,
    LoginModel loginModel
  }){
    return new AppState(
        reduxSetup: reduxSetup ?? this.reduxSetup,
        usuarioModel: usuarioModel ?? this.usuarioModel,
        loginModel: loginModel ?? this.loginModel
    );
  }

  factory AppState.initial(){
    return new AppState(
        reduxSetup: false,
        usuarioModel: UsuarioModel(numDocument: "31232"),
        loginModel: LoginModel(password: "fffff")
        );
  }

  @override
  String toString() {
    return 'AppState: {reduxSetup: $reduxSetup, usuarioModel: $usuarioModel, loginModel: $loginModel}';
  }
}