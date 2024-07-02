import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/info_patient_appointment.dart';
import 'package:flutter_application_4/screen/home_screen.dart';
import 'package:flutter_application_4/screen/walk_in_patient.dart';
import 'package:flutter_application_4/screen/appointment_patient.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Administrator Page"),
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 105,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Register patients",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 24, 183, 141),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                            child: Text(
                          "Appointed Patient",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return WalkIn();
                          },
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 24, 183, 141),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                            child: Text(
                          "Walk-in Patient",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
