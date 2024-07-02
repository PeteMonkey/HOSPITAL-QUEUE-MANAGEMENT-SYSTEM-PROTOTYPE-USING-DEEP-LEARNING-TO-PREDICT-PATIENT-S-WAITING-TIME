import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dr_waiting.dart';
import 'package:app/model/dr_info.dart';
import 'package:http/http.dart' as http;

//searchDoctorText as doctor name

class DrBreak extends StatefulWidget {
  const DrBreak({super.key});

  @override
  State<DrBreak> createState() => _DrBreakState();
}

class _DrBreakState extends State<DrBreak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("    Break"),
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
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Your status is ON BREAK.",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () async {
                        final url = Uri.parse(
                            'http://10.0.2.2:5000/back_button/${searchDoctorText}');
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
                            color: const Color.fromARGB(255, 24, 183, 141),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                            child: Text(
                          "I'M BACK",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
