// ignore_for_file: prefer_const_constructors

import 'package:app/appoint_patient.dart';
import 'package:app/run_queue.dart';
import 'package:app/walkin_patient.dart';
import 'package:flutter/material.dart';

import 'doctor_app/dr.dart';
import 'home_page.dart';

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
        backgroundColor: const Color.fromARGB(255, 24, 183, 141),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Add patient's queue",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return Appointed();
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
                  const SizedBox(
                    height: 55,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return RunQueue();
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
                          "Run Queue here",
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
                            padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return Dr();
                                  },
                                ));
                              },
                              child: const Text(
                                "For Doctor",
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
                ]),
          ),
        ),
      ),
    );
  }
}
