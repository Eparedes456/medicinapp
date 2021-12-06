import 'package:flutter/material.dart';
import 'package:medicianapp/pages/home/HomePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              color: Colors.black,
              child: Image(
                image: NetworkImage(
                    'https://media.istockphoto.com/photos/doctor-holding-digital-tablet-at-meeting-room-picture-id1189304032?k=6&m=1189304032&s=612x612&w=0&h=SJPF2M715kIFAKoYHGbb1uAyptbz6Tn7-LxPsm5msPE='),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Ahora, todos los medicos al alcance de tus manos.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Te conectamos con los mejores especialistas, estés donde estés.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Ingrese su usuario',
                      prefixIcon: Icon(Icons.person))),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Ingrese su contraseña',
                      prefixIcon: Icon(Icons.lock))),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => HomePage(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      'Ingresar',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            /*Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => HomePage(),
                    ),
                  );
                },
                child: Card(
                    elevation: 5,
                    //color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 30,
                            child: Image(
                              image: NetworkImage(
                                  'https://img.icons8.com/color/452/google-logo.png'),
                            ),
                          ),
                          Text('INICIA SESIÓN CON GOOGLE')
                        ],
                      ),
                    )),
              ),
            ),*/
            SizedBox(
              height: 20,
            ),
            /*Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Card(
                  elevation: 5,
                  color: Color.fromRGBO(59, 89, 152, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: 30,
                            child: Image(
                                image: NetworkImage(
                                    'https://i1.wp.com/www.seeklogo.net/wp-content/uploads/2016/09/facebook-icon-preview-200x200.png?resize=200%2C200&ssl=1'),
                                fit: BoxFit.cover)),
                        Text(
                          'INICIA SESIÓN CON FACEBOOK',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )),
            ),*/
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.blue,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('pressed');
                    },
                    child: Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Estoy de acuerdo con los ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'términos y condiciones.',
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        )
                      ])),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 20),
              child: Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.blue,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('pressed');
                    },
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'Acepto el ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'tratamiento de mis datos.',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      )
                    ])),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
