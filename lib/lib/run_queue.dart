import 'dart:convert';
import 'package:app/admin.dart';
import 'package:app/home.dart';
import 'package:app/home_page.dart';
import 'package:app/info_walkin.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
// import 'function.dart';

class RunQueue extends StatefulWidget {
  const RunQueue({super.key});

  @override
  State<RunQueue> createState() => _RunQueueState();
}

class _RunQueueState extends State<RunQueue> {
  final formkey = GlobalKey<FormState>();
  // WalkInPatient myWalkInPatient = WalkInPatient(id: '', fname: '', age: '');
  // String url = '';
  // var data;
  // String output = 'Initial Output';

  final drroomController = TextEditingController();

  @override
  void dispose() {
    drroomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Run Patient Queue"),
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
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Doctor's Room",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  controller: drroomController,
                  validator: RequiredValidator(
                      errorText: "Please enter doctor's room"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Run Queue",
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
                            'http://10.0.2.2:5000/remove/${drroomController.text}');
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
