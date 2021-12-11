import 'package:flutter/material.dart';
import 'dart:convert';

DoctorsModel DoctorsModelFromJson(String str) {
  final jsonData = json.decode(str);
  return DoctorsModel.fromMap(jsonData);
}

String DoctorsModelToJson(DoctorsModel data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class DoctorsModel {
  late int idDoctor;
  late String nombreCompleto;
  late String numColegioMed;
  late String direccion;
  late String foto;
  late String especialidad;
  late String documento;
  late String costo;
  late String descripcion;
  late bool estado;

  DoctorsModel(
      {required this.idDoctor,
      required this.nombreCompleto,
      required this.numColegioMed,
      required this.direccion,
      required this.foto,
      required this.especialidad,
      required this.documento,
      required this.costo,
      required this.descripcion,
      required this.estado});

  factory DoctorsModel.fromMap(Map<String, dynamic> json) => DoctorsModel(
        idDoctor: json["idEspecialidad"],
        nombreCompleto: json["nombre"],
        numColegioMed: json["descripcion"],
        direccion: json[""],
        foto: json[""],
        especialidad: json[""],
        documento: json[""],
        costo: json[""],
        descripcion: json[""],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() {
    return {
      'idDoctor': idDoctor,
      'nombreCompleto': nombreCompleto,
      'numColegioMed': numColegioMed,
      "direccion": direccion,
      "foto": foto,
      "especialidad": especialidad,
      "documento": documento,
      "costo": costo,
      "descripcion": descripcion,
      'estado': estado,
    };
  }
}
