import 'package:app/admin.dart';
import 'package:app/doctor_app/dr_arrive.dart';
import 'package:app/model/dr_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;

class Dr extends StatefulWidget {
  const Dr({super.key});

  @override
  State<Dr> createState() => _DrState();
}

class _DrState extends State<Dr> {
  bool isLoading = false;
  final TextEditingController _searchDoctorController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override

  // void _onEnterPressed(String value) {
  //   // Pass the value to the other dart files or perform any action with the value
  //   // For example, you can pass it to DrArrive widget like this:
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => DrArrive(searchValue: value),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Doctor Application"),
          backgroundColor: Color.fromARGB(255, 24, 183, 141),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return AdminPage();
                },
              ));
            },
          ),
        ),
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
                          height: 85,
                        ),
                        const Icon(
                          Icons.medical_services,
                          size: 120,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        //Hello Again
                        const Text(
                          "Hello Doctor!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Please Enter Your Name",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
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
                                    errorText: "Please enter your name"),
                                controller: _searchDoctorController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "please enter your name",
                                ),
                                onSaved: (String? drName) {
                                  setState(() {
                                    searchDoctorText =
                                        drName!; // Assign the value to the global variable
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        //password textfiel
                        // sign in button
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: GestureDetector(
                            onTap: () async {
                              //use patient ID 1008 as sample
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                print(searchDoctorText);
                                final url = Uri.parse(
                                    'http://10.0.2.2:5000/enter_button/${searchDoctorText}');
                                final response = await http.get(url);
                                if (response.statusCode == 200) {
                                  print(response.body);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DrArrive(),
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
                                "Enter",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              )));
  }
}
