import 'package:flutter/material.dart';

class DoctoresListPage extends StatelessWidget {
  const DoctoresListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categoria'),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Busca al doctor por su nombre',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
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
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
