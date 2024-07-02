import 'package:app/admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class drStatus extends StatefulWidget {
  final String jimRoom;
  final String jimStatus;
  final String jooStatus;
  final String jooRoom;
  drStatus({
    required this.jimRoom,
    required this.jimStatus,
    required this.jooRoom,
    required this.jooStatus,
  });

  @override
  State<drStatus> createState() => _drStatusState();
}

class _drStatusState extends State<drStatus> {
  @override
  Widget build(BuildContext context) {
    var montserrat = TextStyle(
      fontSize: 12,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Status"),
        backgroundColor: Color.fromARGB(255, 26, 202, 205),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return AdminPage();
              },
            ));
          },
        ),
      ),
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 130, 10, 0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 400),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 150,
                              child: Icon(
                                Icons.person,
                                size: 80,
                                color: Colors.black,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 30,
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Doctor:",
                                            style: montserrat,
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            "Room:",
                                            style: montserrat,
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            "Status:",
                                            style: montserrat,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Jim", style: montserrat),
                                          const SizedBox(height: 16),
                                          Text(widget.jimRoom,
                                              style: montserrat),
                                          const SizedBox(height: 16),
                                          Text(widget.jimStatus,
                                              style: montserrat),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 400),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 150,
                              child: Icon(
                                Icons.person,
                                size: 80,
                                color: Colors.black,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 30,
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Doctor:",
                                            style: montserrat,
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            "Room:",
                                            style: montserrat,
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            "Status:",
                                            style: montserrat,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Jim", style: montserrat),
                                          const SizedBox(height: 16),
                                          Text(widget.jooRoom,
                                              style: montserrat),
                                          const SizedBox(height: 16),
                                          Text(widget.jooStatus,
                                              style: montserrat),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
