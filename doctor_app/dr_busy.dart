import 'package:app/doctor_app/dr_ready.dart';
import 'package:app/doctor_app/dr_waiting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:async';
import 'package:app/model/dr_info.dart';
import 'package:http/http.dart' as http;

//searchDoctorText as doctor name

class DrBusy extends StatefulWidget {
  const DrBusy({super.key});

  @override
  State<DrBusy> createState() => _DrBusyState();
}

class _DrBusyState extends State<DrBusy> {
  int minutes = 0; // Variable to store minutes
  int seconds = 0; // Variable to store seconds
  Timer? timer; // Timer object
  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        // Update the time every second
        seconds++;
        if (seconds == 60) {
          // Reset seconds to 0 and increment minutes when seconds reach 60
          seconds = 0;
          minutes++;
        }
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    String timeString =
        '$minutes:${seconds.toString().padLeft(2, '0')}'; // Format time as string
    return Scaffold(
      appBar: AppBar(
        title: const Text("   Busy"),
        backgroundColor: const Color.fromARGB(255, 24, 183, 141),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "You are with your patient", // Display the time string
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Please press the 'Finish' button when you are finished", // Display the time string
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$timeString", // Display the time string
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                              // ... your existing code ...
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () async {
                        final url = Uri.parse(
                            'http://10.0.2.2:5000/finish_button/${searchDoctorText}');
                        final response = await http.get(url);
                        if (response.statusCode == 200) {
                          print(response.body);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DrWaiting(),
                              ));
                        } else if (response.statusCode == 405) {
                          // The server is not set up to handle GET requests for this URL
                          print('Error: Method Not Allowed');
                        } else if (response.statusCode == 500) {
                          // Some other error occurred, handle it here
                          print('Error: ${response.statusCode}');
                        } else {
                          // Some other error occurred, handle it here
                          print('Error: ${response.statusCode}');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(206, 222, 12, 12),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                            child: Text(
                          "Finish",
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
