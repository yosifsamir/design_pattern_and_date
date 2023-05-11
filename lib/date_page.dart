import 'dart:math';

import 'package:flutter/material.dart';

class DatePage extends StatefulWidget {
  const DatePage({Key? key}) : super(key: key);

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  List<Appointment> appointments = [];

  @override
  void initState() {
    for (int index = 0; index < Appointment.days.length; index++) {
      appointments.add(Appointment(Appointment.days[index],[]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                // return Column(
                //   children: [
                //     Text(appointments[index].dates)
                //   ],
                // );
                final Appointment appointment = appointments[index];


                return Container(
                  margin: const EdgeInsetsDirectional.all(16),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: appointment.dates.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          String date =
                              "${appointment.dates[index].month} / ${appointment.dates[index].day}";
                          return Container(
                              color: Color.fromARGB(255, Random().nextInt(255),
                                  Random().nextInt(255), Random().nextInt(255)),
                              child: Row(
                                children: [
                                  Text(date),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          appointment.dates.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 20,
                                      ))
                                ],
                              ));
                        },
                      ),
                      Row(
                        children: [
                          IntrinsicWidth(child: SizedBox(
                            width: MediaQuery.of(context).size.width *.2,
                              child: Text(appointment.day.map(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,)),),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.red,Colors.teal],begin:AlignmentDirectional.topStart,end: AlignmentDirectional.bottomEnd)),
                              child: Center(
                                child: MaterialButton(
                                  color: Colors.lime,
                                  onPressed: () {
                                    setState(() {
                                      appointment.dates.add(DateTime.now());
                                    });
                                  },
                                  child: const Text(
                                    "Add Time",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 3,
                        thickness: 2.5,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}

class Appointment {
  static const List<Day> days = [
    Day.saturday,
    Day.sunday,
    Day.monday,
    Day.tuesday,
    Day.wednesday,
    Day.thursday,
    Day.friday
  ];

  final Day day;
  final List<DateTime> dates;

  Appointment(this.day,this.dates);
}

enum Day { saturday, sunday, monday, tuesday, wednesday, thursday, friday }

extension DayMap on Day{
  String map(){
    switch(this){
      case Day.saturday :
        return "Saturday";
      case Day.sunday:
        return "Sunday";
      case Day.monday:
        return "Monday";
      case Day.tuesday:
        return "Tuesday";
      case Day.wednesday:
        return "Wednesday";
      case Day.thursday:
        return "Thursday";
      case Day.friday:
        return "Friday";
    }
  }
}
