import 'dart:math';
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

class Exercise6 extends StatefulWidget {
  const Exercise6({super.key});

  @override
  State<Exercise6> createState() => _Exercise6ViewState();
}

class _Exercise6ViewState extends State<Exercise6> {
  List<MeetingRoom> meetingRoomsList = [];
  List<MeetingRoom> reservedMeetingRoomsList = [];

  void setMeetingRooms() {
    int roomNum = getRandomNumber(1, 12);
    do {
      meetingRoomsList.add(
          MeetingRoom(getRandomName(), getRandomDate(), getRandomPeople()));
    } while (meetingRoomsList.length < roomNum);
    //setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setMeetingRooms();
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
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: meetingRoomsList.length,
                                      itemBuilder: (context, index) {
                                        return Text(
                                            "${meetingRoomsList[index].name} ${meetingRoomsList[index].date} ${meetingRoomsList[index].people}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87));
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
