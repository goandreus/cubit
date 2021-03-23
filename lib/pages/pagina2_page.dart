import 'package:cubit/models/usuario.dart';
import 'package:cubit/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUSuario
            ? Text('Nombre: ${usuarioService.usuario.nombre}')
            : Text('Pagina 2'),
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
                final newUser = Usuario(
                    nombre: 'Andres Chavez',
                    edad: 26,
                    profesiones: ['Go Dev', 'Flutter Dev']);
                usuarioService.usuario = newUser;
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioService.cmbiarEdad(45);
              },
            ),
            MaterialButton(
              child: Text(
                'Anadir profesion',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioService.agregarProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
