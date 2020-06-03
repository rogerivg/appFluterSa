import 'dart:convert';
import 'package:apppocsa/src/models/productoModel.dart';
import 'package:http/http.dart' as http;


class ProductosProvider{
  final String _url = 'https://flutterpoc-5d31f.firebaseio.com';

  Future<bool> crearProducto( ProductoModel producto) async {
    final url = _url+'/Productos.json';
    final resp = await http.post(url , body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  Future<List<ProductoModel>> cargarProductors() async{
    final url = _url+'/Productos.json';
    final resp = await http.get(url);
    //print("acacacac "+json.decode(resp).toString());
    final List<ProductoModel> productos = new List();
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    if(decodedData == null) return [];
    decodedData.forEach((id, producto) {
      final prodTemp = ProductoModel.fromJson(producto);
      prodTemp.id = id;
      productos.add(prodTemp);
    });
    print(productos);
    return productos;
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