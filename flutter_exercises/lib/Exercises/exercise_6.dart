import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:random_datetime/random_datetime.dart';
import 'package:random_datetime/random_dt_options.dart';

class MeetingRoom {
  String name;
  String date;
  int people;

  MeetingRoom(this.name, this.date, this.people);
}

List<MeetingRoom> meetingRoomsList = [];
List<MeetingRoom> reservedMeetingRoomsList = [];

//------>  NavBar
class Exercise6 extends StatefulWidget {
  const Exercise6({super.key});

  @override
  State<Exercise6> createState() => _Exercise6ViewState();
}

class _Exercise6ViewState extends State<Exercise6> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setMeetingRooms();
  }

  @override
  void dispose() {
    super.dispose();
  }

  static final List<Widget> _widgetOptions = [
    const Exercise6Page(),
    const Exercise6Reserved()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment,
              color: Colors.black87,
            ),
            label: "Salas de reuniones",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in, color: Colors.black87),
            label: "Reservas",
          )
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromRGBO(255, 255, 255, 1.0),
        onTap: _onItemTapped,
      ),
    );
  }

  void setMeetingRooms() {
    int roomNum = getRandomNumber(1, 12);
    do {
      meetingRoomsList.add(
          MeetingRoom(getRandomName(), getRandomDate(), getRandomPeople()));
    } while (meetingRoomsList.length < roomNum);
  }

  int getRandomNumber(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  String getRandomName() {
    List<int> nums = [];
    int num;
    do {
      num = getRandomNumber(1, 20);
    } while (nums.contains(num));
    nums.add(num);
    return "Sala $num";
  }

  int getRandomPeople() {
    List<int> nums = [];
    int num;
    do {
      num = getRandomNumber(1, 20);
    } while (nums.contains(num));
    nums.add(num);
    return num;
  }

  String getRandomDate() {
    DateTime currentDate = DateTime.now();
    final dateOptions = RandomDTOptions(
      allowPastDates: true,
      futureYearLimit: 0,
      startYear: currentDate.year - 1,
    );
    final randomDT = RandomDateTime(options: dateOptions);
    final randomDateTime = randomDT.random();
    var formatter = DateFormat("dd-MM-yyyy");
    return formatter.format(randomDateTime);
  }
}

//------>  Página principal que muestra las salas de reuniones
class Exercise6Page extends StatefulWidget {
  const Exercise6Page({super.key});

  @override
  State<Exercise6Page> createState() => _Exercise6PageState();
}

class _Exercise6PageState extends State<Exercise6Page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  spacing: 20,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: _onExitButtonPressed,
                          icon: const Icon(Icons.arrow_back_sharp),
                          iconSize: 35,
                          color: Colors.black87,
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Ejercicio 6",
                            style:
                                TextStyle(fontSize: 40, color: Colors.black87))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 450,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              border:
                                  Border.all(width: 2, color: Colors.black87),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                spacing: 15,
                                children: [
                                  Text("Salas de reuniones",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.black87)),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: meetingRoomsList.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black87),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2.5,
                                                      blurRadius: 3.5,
                                                      offset:
                                                          const Offset(2, 4))
                                                ]),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              spacing: 25,
                                              children: [
                                                IconButton(
                                                  onPressed: () =>
                                                      _onReserveButtonPressed(
                                                          index),
                                                  tooltip: "Reserve",
                                                  icon: const Icon(Icons
                                                      .bookmark_add_outlined),
                                                ),
                                                Text(
                                                    meetingRoomsList[index]
                                                        .name,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87)),
                                                Text(
                                                    "${meetingRoomsList[index].people} personas",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black87)),
                                                Text(
                                                    textAlign: TextAlign.end,
                                                    meetingRoomsList[index]
                                                        .date,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.black87))
                                              ],
                                            ));
                                      })
                                ],
                              ),
                            ))
                      ],
                    )
                  ],
                ))));
  }

  void _onExitButtonPressed() {
    Navigator.pop(context);
  }

  void _onReserveButtonPressed(int index) {
    reservedMeetingRoomsList.add(meetingRoomsList[index]);
    meetingRoomsList.removeAt(index);
    setState(() {});
  }
}

//------>  Página que muestra las salas de reuniones reservadas
class Exercise6Reserved extends StatefulWidget {
  const Exercise6Reserved({super.key});

  @override
  State<Exercise6Reserved> createState() => _Exercise6ReservedState();
}

class _Exercise6ReservedState extends State<Exercise6Reserved> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  spacing: 20,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: _onExitButtonPressed,
                          icon: const Icon(Icons.arrow_back_sharp),
                          iconSize: 35,
                          color: Colors.black87,
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Ejercicio 6",
                            style:
                                TextStyle(fontSize: 40, color: Colors.black87))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 450,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              border:
                                  Border.all(width: 2, color: Colors.black87),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                spacing: 15,
                                children: [
                                  Text("Salas reservadas",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.black87)),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          reservedMeetingRoomsList.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black87),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2.5,
                                                      blurRadius: 3.5,
                                                      offset:
                                                          const Offset(2, 4))
                                                ]),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              spacing: 25,
                                              children: [
                                                IconButton(
                                                  onPressed: () =>
                                                      _onCancelReservationButtonPressed(
                                                          index),
                                                  tooltip: "Cancel reservation",
                                                  icon: const Icon(
                                                      Icons.bookmark),
                                                ),
                                                Text(
                                                    reservedMeetingRoomsList[
                                                            index]
                                                        .name,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87)),
                                                Text(
                                                    "${reservedMeetingRoomsList[index].people} personas",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black87)),
                                                Text(
                                                    textAlign: TextAlign.end,
                                                    reservedMeetingRoomsList[
                                                            index]
                                                        .date,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.black87))
                                              ],
                                            ));
                                      })
                                ],
                              ),
                            ))
                      ],
                    )
                  ],
                ))));
  }

  void _onExitButtonPressed() {
    Navigator.pop(context);
  }

  void _onCancelReservationButtonPressed(int index) {
    meetingRoomsList.add(reservedMeetingRoomsList[index]);
    reservedMeetingRoomsList.removeAt(index);
    setState(() {});
  }
}
