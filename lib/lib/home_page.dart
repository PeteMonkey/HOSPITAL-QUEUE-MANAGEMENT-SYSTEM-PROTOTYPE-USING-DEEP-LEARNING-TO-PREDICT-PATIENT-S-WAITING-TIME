// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:app/confirm_app.dart';
import 'package:app/ticket.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'admin.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //text controller
  //Map<String, dynamic> userMap;
  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();
  final _searchController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool isLoading = false;
  String doctorName = '';
  String ticketNumber = '';
  String waitingTime = '';

  void onSearch() async {}

  @override
  void dispose() {
    _emailController.dispose();
    _paswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  value: 1.1,
                  semanticsLabel: 'Circular progress indicator',
                ),
              )
            : SafeArea(
                child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 65,
                        ),
                        const Icon(
                          Icons.local_hospital,
                          size: 120,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        //Hello Again
                        const Text(
                          "Hello there!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Welcome to Electrical Engineering Hospital",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Search for your queue right here",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                validator: RequiredValidator(
                                    errorText: "Please enter your patient ID"),
                                controller: _searchController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your patient ID",
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                        ),
                        //password textfiel
                        // sign in button
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: GestureDetector(
                            onTap: () async {
                              //use patient ID 1008 as sample
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                final url = Uri.parse(
                                    'http://10.0.2.2:5000/get_patient_data_button/${_searchController.text}');
                                // 'http://10.0.2.2:5000/addqueue?name=${nameController.text}&age=${ageController.text}&id=${idController.text}&drroom=${drroomController.text}');

                                final response = await http.get(url);
                                if (response.statusCode == 200) {
                                  // The request was successful, do something here if needed
                                  print(response.body);
                                  final json = jsonDecode(response.body);
                                  final ticket = json[1];
                                  final doctorName = ticket['Dr_Name'];
                                  final ticketNumber = ticket['Ticket'];
                                  final waitingTime = ticket['Waiting_Time'];
                                  final doctorRoom = ticket['Dr_Room'];
                                  final patientAhead = ticket['Patient Ahead'];
                                  final patientID = ticket['Patient_ID'];
                                  print('Doctor name: $doctorName');
                                  print('Ticket number: $ticketNumber');
                                  print('Waiting time: $waitingTime');
                                  print('Doctor name: $doctorRoom');
                                  print('Ticket number: $patientAhead');
                                  print('Patient ID: $patientID');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Ticket(
                                        patientID: patientID.toString(),
                                        doctorName: doctorName.toString(),
                                        ticketNumber: ticketNumber.toString(),
                                        waitingTime: waitingTime.toString(),
                                        doctorRoom: doctorRoom.toString(),
                                        patientAhead: patientAhead.toString(),
                                      ),
                                    ),
                                  );
                                } else if (response.statusCode == 405) {
                                  // The server is not set up to handle GET requests for this URL
                                  print('Error: Method Not Allowed');
                                } else if (response.statusCode == 500) {
                                  // Some other error occurred, handle it here
                                  print(
                                      'Error: Unable to find your queue, please make sure you are registered');
                                } else {
                                  // Some other error occurred, handle it here
                                  print('Error: ${response.statusCode}');
                                }

                                formkey.currentState!.reset();
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 24, 183, 141),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Center(
                                  child: Text(
                                "Search",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Have an appointment? Comfirm right here",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //not a member?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 65.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return ConfirmApp();
                                },
                              ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 24, 183, 141),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                  child: Text(
                                "Comfirm Appointment",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )),
                            ),
                          ),
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 60, 30, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                        builder: (context) {
                                          return AdminPage();
                                        },
                                      ));
                                    },
                                    child: const Text(
                                      "For Administrator",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 80, 3),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )));
  }
}
