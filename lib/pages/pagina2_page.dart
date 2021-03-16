import 'package:cubit/models/usuario.dart';
import 'package:cubit/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text('Nombre ${snapshot.data.nombre}')
                : Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              child: Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                final nuevoUsuario = Usuario(nombre: 'andres', edad: 26);
                usuarioService.cargarUsuario(nuevoUsuario);
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(30);
              },
            ),
            MaterialButton(
              child: Text(
                'Anadir profesion',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
