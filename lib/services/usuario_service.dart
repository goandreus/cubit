import 'dart:async';

import 'package:cubit/models/usuario.dart';

class _UsuarioService {
  Usuario _usuario;

  StreamController _usuarioStremController =
      StreamController<Usuario>.broadcast();

  Usuario get usuario => this._usuario;

  bool get existeUsuario => (this._usuario != null) ? true : false;

  Stream<Usuario> get usuarioStream => _usuarioStremController.stream;

  void cargarUsuario(Usuario user) {
    this._usuario = user;
    _usuarioStremController.add(user);
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    _usuarioStremController.add(this._usuario);
  }

  dispose() {
    _usuarioStremController?.close();
  }

  // void cambiarProfesion(List profesion) {
  //   this._usuario.profesiones = profesion;
  //   this._usuarioStremController.add(this._usuario);
  // }
}

final usuarioService = _UsuarioService();
