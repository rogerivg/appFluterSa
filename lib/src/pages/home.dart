import 'package:apppocsa/src/models/app_state.dart';
import 'package:apppocsa/src/models/productoModel.dart';
import 'package:apppocsa/src/providers/productosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatelessWidget {
  final productosProvider = new ProductosProvider();
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Home ' + state.usuarioModel.userName),
              backgroundColor: Colors.red[900],
              actions: <Widget>[
                Image.asset('icons/accenture.png', height: 20, width: 20),
              ],
            ),
            body: _crearListado(),
            floatingActionButton: _crearBoton(context),
        );
        }
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: productosProvider.cargarProductors(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
        if(snapshot.hasData){
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context,i )=>_crearItem(context, productos[i]),
          );
        }else{
          return Center(
            child: CircularProgressIndicator()
          );
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto){
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion){
        productosProvider.borrarProducto(producto.id);
      },
      child: ListTile(
        title: Text(producto.titulo + "-" + producto.valor.toString()),
        subtitle: Text(producto.id),
        onTap:()=> Navigator.pushNamed(context, 'producto' , arguments: producto),
      ),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.red[900],
      onPressed: ()=>Navigator.pushNamed(context, 'producto'),
    );
  }


}
