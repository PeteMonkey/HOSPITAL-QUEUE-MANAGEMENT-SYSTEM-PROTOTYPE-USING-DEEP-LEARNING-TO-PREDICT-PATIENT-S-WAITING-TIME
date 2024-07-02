import 'package:app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class Ticket extends StatefulWidget {
  final String doctorName;
  final String ticketNumber;
  final String waitingTime;
  final String patientAhead;
  final String doctorRoom;
  final String patientID;

  Ticket({
    required this.doctorName,
    required this.ticketNumber,
    required this.waitingTime,
    required this.patientAhead,
    required this.doctorRoom,
    required this.patientID,
  });

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text("Your Ticket!"),
        backgroundColor: Color.fromARGB(255, 24, 183, 141),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ));
          },
        ),
      ),
      body: Center(
        child: TicketWidget(
          width: 350,
          height: 500,
          isCornerRounded: true,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 240.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 1.0, color: Colors.green),
                      ),
                      child: const Center(
                        child: Text(
                          'Electrical Engineer Hospital',
                          style: TextStyle(
                              color: Color.fromARGB(255, 24, 183, 141)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, bottom: 10, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14, right: 35.0),
                        child: ticketDetailsWidget('Patient', 'Pete Monkey',
                            'Patient ID', widget.patientID),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0, right: 12.0),
                        child: ticketDetailsWidget(
                            'Queue Ahead',
                            widget.patientAhead,
                            'Queue Ticket',
                            widget.ticketNumber),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0, right: 53.0),
                        child: ticketDetailsWidget('Room', widget.doctorRoom,
                            'Doctor', widget.doctorName),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    '_____________________________________',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Center(child: const Text('Estimated Waiting Time')),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          widget.waitingTime,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Center(
                      //   child: Text(
                      //     'mins',
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 20,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}
