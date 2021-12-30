import 'package:flutter/material.dart';
import 'dart:convert';

HorariosModel horarioFromJson(String str){

  final jsonData = json.decode(str);
  return HorariosModel.fromMap(jsonData);

}

String horarioToJson( HorariosModel data ){
  final dyn = data.toMap();
  return json.encode(dyn);
}

class HorariosModel {

  late int idHorario;
  late String descripcion;
  

  HorariosModel({
    required this.idHorario, required this.descripcion, 
  });  

  factory HorariosModel.fromMap(Map<String, dynamic> json) => HorariosModel(

    idHorario         : json["idHorario"],
    descripcion       : json["descripcion"],
    
            
  );


  Map<String,dynamic> toMap(){

    return {

      'idHorario'         : idHorario,
      'descripcion'       : descripcion,
           
    };
  }

}