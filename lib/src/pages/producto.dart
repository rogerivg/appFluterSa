import 'package:apppocsa/src/models/productoModel.dart';
import 'package:apppocsa/src/providers/productosProvider.dart';
import 'package:apppocsa/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();

  ProductoModel producto = new ProductoModel();
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;

    if(prodData != null){
      producto = prodData;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        backgroundColor: Colors.red[900],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.photo_size_select_actual), onPressed: (){}),
          IconButton(icon: Icon(Icons.photo_camera), onPressed: (){}),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
              child: Column(
                children: <Widget>[
                  _crearNombre(),
                  _crearPrecio(),
                  _crearDisponible(),
                  _crearBoton()
            ],
          )),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value)=>producto.titulo = value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese el nombre del producto';
        }
        else{
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
          labelText: 'Precio'
      ),
      onSaved: (value)=>producto.valor = double.parse(value),
      validator: (value){
        if(utils.isNumeric(value)){
          return null;
        }
        else{
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearDisponible() {
    return SwitchListTile(
        value: producto.disponible,
        title: Text('Disponible'),
        onChanged: (value) => setState((){
          producto.disponible = value;
        })
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        label: Text('Guardar'),
        icon:Icon(Icons.save),
        onPressed: (){
          _submit();
        },
    );
  }

  void _submit(){
    if(!formKey.currentState.validate()) return;

    formKey.currentState.save();

    print('todo ok');
    print(producto.titulo);
    print(producto.valor);
    print(producto.disponible);

    if(producto.id == null){
      productosProvider.crearProducto(producto);
    }else{
      productosProvider.editarProducto(producto);
    }

  }
}
