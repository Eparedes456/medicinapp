import 'package:flutter/material.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              //color: Colors.black,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: double.infinity,
                    color: Colors.blue,
                  ),
                  Positioned(
                    top: 30,
                    left: 12,
                    child: GestureDetector(
                        child: Icon(Icons.arrow_back, color: Colors.white)),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80')),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Nombre doctor',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Especialidad',
              style: TextStyle(color: Colors.teal, fontSize: 13),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Tiempo aprox.'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('60 min')
                    ],
                  ),
                  Column(
                    children: [
                      Text('CMP '),
                      SizedBox(
                        height: 5,
                      ),
                      Text('455')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
