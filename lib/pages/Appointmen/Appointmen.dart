import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmenPage extends StatelessWidget {
  const AppointmenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar cita'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Los horarios que se muestran a continuación son para los dias de Lunes a Domingo'),
            /*Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                width: double.infinity,
                child: TableCalendar(
                  shouldFillViewport: true,
                  firstDay: DateTime(2020),
                  lastDay: DateTime(2021),
                  focusedDay: DateTime(2020),
                ),
              ),
            ),*/
            Divider(
              color: Colors.grey,
            ),

            /*Expanded(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.2,
                  width: double.infinity,
                  //color: Colors.black,
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    calendarStyle: CalendarStyle(),
                  )),
            ),*/
            Expanded(
                child: Container(
              color: Colors.red,
            )),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Programar horario',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
