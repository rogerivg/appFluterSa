import 'package:apppocsa/src/actions/appActions.dart';
import 'package:redux/redux.dart';

final AppReducer = TypedReducer<bool, AppAction>(_appActionReducer);

bool _appActionReducer(bool state, AppAction action) {
  return action.appPayload;
}