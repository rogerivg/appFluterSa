import 'dart:convert';
import 'package:apppocsa/src/models/models.dart';
import 'package:apppocsa/src/models/productoModel.dart';
import 'package:http/http.dart' as http;


class LoginProvider{
  final String _url = 'https://apimanagmentpoc.azure-api.net';
  /*
  Future<bool> crearProducto( ProductoModel producto) async {
    final url = _url+'/Productos.json';
    final resp = await http.post(url , body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }*/

  Future<UsuarioModel> cargarLogin(document, password) async{
    print("entrooooo");
    final Map<String, dynamic> bodyData = {
      "doc": document.toString(),
      "pass": password.toString(),
    };
    print("infooo");
    print(bodyData);
    final url = _url+'/serviceLogin';
    final resp = await http.post(Uri.encodeFull(url),body: json.encode(bodyData), headers: {
      "Ocp-Apim-Subscription-Key":"c1c11b72463f4f6bbf86b4b2ebde64d4"});
    print("acacacac "+resp.body);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    print(decodedData['ok']);
    if(decodedData['ok'] == false){
      throw Exception('Login failed');
    }
    else{
      final usuarioLogin = UsuarioModel.fromJson(decodedData['body']);
      return usuarioLogin;
    }
  }

  Future<bool> editarProducto( ProductoModel producto) async {
    final url = _url+'/Productos/'+producto.id+'.json';
    final resp = await http.put(url , body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  Future<int> borrarProducto(String id) async{
    final url = _url+'/Productos/'+id+'.json';
    final resp = await http.delete(url);
    print(json.decode(resp.body));
    return 1;
  }

}