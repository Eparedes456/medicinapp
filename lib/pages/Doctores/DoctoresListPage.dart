import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicianapp/controller/DoctoresController/ListDocController.dart';

class DoctoresListPage extends StatelessWidget {
  const DoctoresListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LisDocController>(
      init: LisDocController(),
      builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text(_.nameEspecialidad),
          ),
          body: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Busca al doctor por su nombre',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _.loading == true && _.haydata == false
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Expanded(
                        child: Container(
                            child: ListView.builder(
                          itemCount: _.doclist.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: GestureDetector(
                                onTap: () {
                                  _.navigateToAgendar(
                                      _.doclist[index].idDoctor.toString());
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 5,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 80,
                                              //color: Colors.blue,
                                              child: Stack(
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      height: 70,
                                                      width: 70,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),

                                                        //color: Colors.black
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Image(
                                                          image: MemoryImage(
                                                              base64Decode(_
                                                                  .doclist[
                                                                      index]
                                                                  .foto)),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 5,
                                                    right: 8,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _.navigateToPerDoc(
                                                            _.doclist[index]);
                                                      },
                                                      child: Container(
                                                        height: 20,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
                                                        child: Center(
                                                            child: Icon(
                                                                Icons
                                                                    .visibility,
                                                                size: 20,
                                                                color: Colors
                                                                    .blue)),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    _.doclist[index]
                                                        .nombreCompleto,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  _.doclist[index].especialidad,
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    'CMP: ' +
                                                        _.doclist[index]
                                                            .numColegioMed,
                                                    style: TextStyle(
                                                        color: Colors.grey)),
                                              ],
                                            )
                                          ],
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    'Importe',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'S/' +
                                                        _.doclist[index].costo,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    'Duración',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '60 min',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                        /*ListTile(
                                    leading: Stack(
                                      children: [
                                        Container(
                                          height: 130,
                                          width: 100,
                                          color: Colors.blue,
                                        )
                        
                                        /*CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                          'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                                    ),*/
                                      ],
                                    ),
                                    title: Text(_.doclist[index].nombreCompleto),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Dni: ${_.doclist[index].documento}'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                'CMP: ${_.doclist[index].numColegioMed}'),
                                            /*Row(
                                                  children: [
                                                    Icon(Icons.star,
                                                        size: 18,
                                                        color: Colors.yellow[700]),
                                                    Icon(Icons.star,
                                                        size: 18,
                                                        color: Colors.yellow[700]),
                                                    Icon(Icons.star,
                                                        size: 18,
                                                        color: Colors.yellow[700]),
                                                    Icon(Icons.star,
                                                        size: 18,
                                                        color: Colors.yellow[700]),
                                                    Icon(Icons.star,
                                                        size: 18,
                                                        color: Colors.yellow[700]),
                                                  ],
                                                ),*/
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.teal,
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: Text(
                                                  'Revisa su perfil',
                                                  style:
                                                      TextStyle(color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),*/
                                        ,
                                        SizedBox(
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )

                            /*SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 50,
                                  ),
                                  title: Text('nombre doctor'),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('CMP: 86719'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  size: 18,
                                                  color: Colors.yellow[700]),
                                              Icon(Icons.star,
                                                  size: 18,
                                                  color: Colors.yellow[700]),
                                              Icon(Icons.star,
                                                  size: 18,
                                                  color: Colors.yellow[700]),
                                              Icon(Icons.star,
                                                  size: 18,
                                                  color: Colors.yellow[700]),
                                              Icon(Icons.star,
                                                  size: 18,
                                                  color: Colors.yellow[700]),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.teal,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Text(
                                                'Revisa su perfil',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),*/
                            ),
                      )
              ],
            ),
          )),
    );
  }
}
