import 'dart:async';

import 'package:cubit/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier {
  Usuario _usuario;

  Usuario get usuario => this._usuario;
  bool get existeUSuario => (this._usuario != null) ? true : false;

  set usuario(Usuario user) {
    this._usuario = user;
    notifyListeners();
  }

  void cmbiarEdad(int edad) {
    this._usuario.edad = edad;
    notifyListeners();
  }

  void remoerUsuario() {
    this._usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    this
        ._usuario
        .profesiones
        .add('Profesion ${this._usuario.profesiones.length + 1}');
    notifyListeners();
  }
}
