import 'package:apppocsa/src/providers/loginProvider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /*test('Test login provider', () async {
    final loginProvider = LoginProvider();
    var login =loginProvider.cargarLogin("123456", "123456"); //.then((value) => expect(find.text("Hola mundo"), find.text("Hola")) );
    expect(await login.then((value) => value.userName), "Hola mundo");

  });*/

  test('Test login provider', () async {
    final loginProvider = LoginProvider();
    var login =loginProvider.cargarLogin("123456", "123456"); //.then((value) => expect(find.text("Hola mundo"), find.text("Hola")) );
    expect(await login.then((value) => value.userName), "Roger Gonzalez");

  });
}