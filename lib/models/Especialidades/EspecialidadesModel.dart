import 'package:flutter/material.dart';
import 'dart:convert';

EspecialidadesModel especialidadesFromJson(String str){

  final jsonData = json.decode(str);
  return EspecialidadesModel.fromMap(jsonData);

}

String especialidadesToJson( EspecialidadesModel data ){
  final dyn = data.toMap();
  return json.encode(dyn);
}

class EspecialidadesModel {

  late int idEspecialidad;
  late String nombre;
  late String descripcion;
  late bool estado;

  EspecialidadesModel({
    required this.idEspecialidad, required this.nombre, required this.descripcion, required this.estado
  });  

  factory EspecialidadesModel.fromMap(Map<String, dynamic> json) => EspecialidadesModel(

    idEspecialidad        : json["idEspecialidad"],
    nombre                : json["nombre"],
    descripcion           : json["descripcion"],
    estado                : json["estado"],
            
  );


  Map<String,dynamic> toMap(){

    return {
      'idEspecialidad'      : idEspecialidad,
      'nombre'              : nombre,
      'descripcion'         : descripcion,
      'estado'              : estado,
           
    };
  }

}