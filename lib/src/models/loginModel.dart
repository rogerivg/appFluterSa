import 'package:meta/meta.dart';
import 'dart:convert';


@immutable
class LoginModel {
  final String numDocument;
  final String password;

  const LoginModel({
    this.numDocument, this.password
  });

  LoginModel copyWith({
    String numDocument,
    String password
  }){
    return new LoginModel(
        numDocument: numDocument ?? this.numDocument,
        password: password ?? this.password
    );
  }

  factory LoginModel.initial(){
    return new LoginModel(
        numDocument: "",
        password: ""
    );
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    numDocument: json["numDocument"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "numDocument": numDocument,
    "password": password,
  };
/*
  @override
  String toString() {
    return 'AppState: {reduxSetup: $reduxSetup}';
  }*/
}