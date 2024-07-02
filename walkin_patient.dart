import 'dart:convert';
import 'package:app/admin.dart';
import 'package:app/home.dart';
import 'package:app/home_page.dart';
import 'package:app/info_walkin.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
// import 'function.dart';

class WalkIn extends StatefulWidget {
  const WalkIn({super.key});

  @override
  State<WalkIn> createState() => _WalkInState();
}

class _WalkInState extends State<WalkIn> {
  final formkey = GlobalKey<FormState>();
  // WalkInPatient myWalkInPatient = WalkInPatient(id: '', fname: '', age: '');
  // String url = '';
  // var data;
  // String output = 'Initial Output';
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final idController = TextEditingController();
  final drroomController = TextEditingController();

  void _saveData() async {
    final url = Uri.parse('http://10.0.2.2:5000/api');
    final response = await http.post(url, body: {
      'name': nameController.text,
      'age': ageController.text,
      'id': idController.text,
      'drroom': drroomController.text,
    });
    if (response.statusCode == 200) {
      // The request was successful, do something here if needed
      print(response.body);
    } else if (response.statusCode == 405) {
      // The server is not set up to handle POST requests for this URL
      print('Error: Method Not Allowed');
    } else {
      // Some other error occurred, handle it here
      print('Error: ${response.statusCode}');
    }
    print(response.body);
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    idController.dispose();
    drroomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add queue for Walk-in patient"),
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "name",
                //   style: TextStyle(fontSize: 20),
                // ),
                // TextFormField(
                //   controller: nameController,
                //   validator: RequiredValidator(
                //       errorText: "Please enter patient's name"),
                //   // onSaved: (String? fname) {
                //   //   myWalkInPatient.fname = fname!;
                //   // },
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // Text(
                //   "age",
                //   style: const TextStyle(fontSize: 20),
                // ),
                // TextFormField(
                //   controller: ageController,
                //   validator: RequiredValidator(
                //       errorText: "Please enter patient's age"),
                //   // onSaved: (String? age) {
                //   //   myWalkInPatient.age = age!;
                //   // },
                //   keyboardType: TextInputType.number,
                // ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "ID",
                  style: const TextStyle(fontSize: 20),
                ),
                TextFormField(
                  controller: idController,
                  validator:
                      RequiredValidator(errorText: "Please enter patient's id"),
                  // onSaved: (String? age) {
                  //   myWalkInPatient.age = age!;
                  // },
                  keyboardType: TextInputType.number,
                ),

                SizedBox(
                  height: 15,
                ),
                Text(
                  "Doctor's Name",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  controller: drroomController,
                  validator: RequiredValidator(
                      errorText: "Please enter doctor's name"),
                  // onSaved: (String? id) {
                  //   myWalkInPatient.id = id!;
                  // },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Add Queue",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 24, 183, 141)),
                    ),
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        final url = Uri.parse(
                            'http://10.0.2.2:5000/walkin/${idController.text}/${drroomController.text}');
                        // 'http://10.0.2.2:5000/addqueue?name=${nameController.text}&age=${ageController.text}&id=${idController.text}&drroom=${drroomController.text}');

                        final response = await http.get(url);
                        if (response.statusCode == 200) {
                          // The request was successful, do something here if needed
                          print(response.body);
                        } else if (response.statusCode == 405) {
                          // The server is not set up to handle GET requests for this URL
                          print('Error: Method Not Allowed');
                        } else {
                          // Some other error occurred, handle it here
                          print('Error: ${response.statusCode}');
                        }
                        formkey.currentState!.reset();
                      }
                    },
                  ),
                ),
                // TextButton(
                //     onPressed: () async {
                //       data = await fetchdata(url);
                //       var decoded = jsonDecode(data);
                //       _saveData;
                //       setState(() {
                //         output = decoded['output'];
                //       });
                //     },
                //     child: Text(
                //       'Fetch ASCII Value',
                //       style: TextStyle(fontSize: 20),
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
