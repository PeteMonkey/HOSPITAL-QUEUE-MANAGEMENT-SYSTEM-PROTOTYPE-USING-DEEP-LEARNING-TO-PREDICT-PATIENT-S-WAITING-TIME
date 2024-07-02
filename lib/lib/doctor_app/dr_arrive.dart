import 'package:app/doctor_app/dr.dart';
import 'package:app/doctor_app/dr_waiting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app/model/dr_info.dart';
import 'package:http/http.dart' as http;

class DrArrive extends StatefulWidget {
  const DrArrive({super.key});

  @override
  State<DrArrive> createState() => _DrArriveState();
}

class _DrArriveState extends State<DrArrive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arrived"),
        backgroundColor: const Color.fromARGB(255, 24, 183, 141),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            final url = Uri.parse(
                'http://10.0.2.2:5000/exit_button/${searchDoctorText}');
            final response = await http.get(url);
            if (response.statusCode == 200) {
              print(response.body);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dr(),
                  ));
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
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome, ${searchDoctorText}", // Access the drName property from drInfo
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Please press 'Get Started' when you are ready.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () async {
                        final url = Uri.parse(
                            'http://10.0.2.2:5000/get_start_button/${searchDoctorText}');
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
                          print(
                              'Error: Unable to find your queue, please make sure you are registered');
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
                          "Get Started",
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
