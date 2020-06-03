import 'dart:async';

class Validators {

  final validateDocument = StreamTransformer<String, String>.fromHandlers(
      handleData: (document, sink){
        if(document.length >=5){
          sink.add(document);
        }
        else{
          sink.addError('Ingrese un doc valido');
        }
      }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length >=6){
        sink.add(password);
      }
      else{
        sink.addError('La contraseña debe tener + de 6');
      }
    }
  );
}