import 'package:apppocsa/src/models/models.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

//modelo generado con https://app.quicktype.io/?share=VO4BaKpEApH9DnIcUiUG

UsuarioModel usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

@immutable
class UsuarioModel {
  final String numDocument;
  final String userName;

  const UsuarioModel({
    @required this.numDocument, this.userName
  });

  UsuarioModel copyWith({
    String numDocument,
    String userName
  }){
    return new UsuarioModel(
        numDocument: numDocument ?? this.numDocument,
        userName: userName ?? this.userName
    );
  }

  factory UsuarioModel.initial(){
    return new UsuarioModel(
        numDocument: "",
        userName: ""
    );
  }

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
    numDocument: json["numDocument"],
    userName: json["userName"],
  );

  Map<String, dynamic> toJson() => {
    "numDocument": numDocument,
    "userName": userName,
  };
/*
  @override
  String toString() {
    return 'AppState: {reduxSetup: $reduxSetup}';
  }*/
}