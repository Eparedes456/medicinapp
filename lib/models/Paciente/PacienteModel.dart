import 'package:flutter/material.dart';
import 'dart:convert';

PacienteModel especialidadesFromJson(String str){

  final jsonData = json.decode(str);
  return PacienteModel.fromMap(jsonData);

}

String especialidadesToJson( PacienteModel data ){
  final dyn = data.toMap();
  return json.encode(dyn);
}

class PacienteModel {

  late int idUsuario;
  late String nombre;
  late String apellidoPaterno;
  late String apellidoMaterno;
  late String dni;
  late String email;
  late bool estado;

  PacienteModel({
    required this.idUsuario, required this.nombre, required this.apellidoPaterno, 
    required this.apellidoMaterno,required this.dni,required this.email,required this.estado
  });  

  factory PacienteModel.fromMap(Map<String, dynamic> json) => PacienteModel(

    idUsuario         : json["idUsuario"],
    nombre            : json["nombre"],
    apellidoPaterno   : json["apellidoPaterno"],
    apellidoMaterno   : json["apellidoMaterno"],
    dni               : json["dni"],
    email             : json["email"],
    estado            : json["estado"],
            
  );


  Map<String,dynamic> toMap(){

    return {

      'idUsuario'         : idUsuario,
      'nombre'            : nombre,
      'apellidoPaterno'   : apellidoPaterno,
      'apellidoMaterno'   : apellidoMaterno,
      'dni'               : dni,
      'email'             : email,
      'estado'            : estado,
           
    };
  }

}