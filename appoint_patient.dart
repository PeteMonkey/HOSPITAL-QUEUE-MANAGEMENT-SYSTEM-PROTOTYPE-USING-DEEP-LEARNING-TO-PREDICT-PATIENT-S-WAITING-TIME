// ignore_for_file: prefer_const_constructors

import 'package:app/admin.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
// import 'function.dart';

class Appointed extends StatefulWidget {
  const Appointed({super.key});

  @override
  State<Appointed> createState() => _AppointedState();
}

class _AppointedState extends State<Appointed> {
  final formkey = GlobalKey<FormState>();
  // WalkInPatient myWalkInPatient = WalkInPatient(id: '', fname: '', age: '');
  // String url = '';
  // var data;
  // String output = 'Initial Output';
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final idController = TextEditingController();
  final drroomController = TextEditingController();
  final dateController = TextEditingController();
  final starttimeController = TextEditingController();
  final endtimeController = TextEditingController();
  DateTime? selectedDate; // initialize as null

  void _saveData() async {
    final url = Uri.parse('http://10.0.2.2:5000/api');
    final response = await http.post(url, body: {
      'name': nameController.text,
      'age': ageController.text,
      'id': idController.text,
      'drroom': drroomController.text,
      'date': dateController.text,
      'starttime': starttimeController.text,
      'endtime': endtimeController.text,
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
    dateController.dispose();
    starttimeController.dispose();
    endtimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add queue for appointment patient"),
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
                // SizedBox(
                //   height: 15,
                // ),
                Text(
                  "ID",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  controller: idController,
                  validator:
                      RequiredValidator(errorText: "Please enter patient's id"),
                  // onSaved: (String? id) {
                  //   myWalkInPatient.id = id!;
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
                  height: 5,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 24, 183, 141)),
                  ),
                  onPressed: () async {
                    final DateTime? newSelectedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2021, 1, 1),
                      lastDate: DateTime(2030, 12, 31),
                      helpText: 'SELECT A DATE',
                      cancelText: 'CANCEL',
                      confirmText: 'SELECT',
                    );
                    if (newSelectedDate != null) {
                      setState(() {
                        selectedDate = newSelectedDate;
                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                        dateController.text = formatter.format(selectedDate!);
                      });
                    }
                  },
                  child: Text('Select Date'),
                ),
                TextFormField(
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Appointment Date',
                    hintText: 'Please select Date',
                  ),
                  validator:
                      RequiredValidator(errorText: "Please select the date"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 24, 183, 141)),
                  ),
                  onPressed: () async {
                    final TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectedTime != null) {
                      String formattedTime =
                          '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}';
                      starttimeController.text = formattedTime;
                    }
                  },
                  child: Text('Select Start Time'),
                ),
                TextFormField(
                  controller: starttimeController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Appointment Starting Time',
                  ),
                  validator: RequiredValidator(
                      errorText: "Please select the start time"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 24, 183, 141)),
                  ),
                  onPressed: () async {
                    final TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectedTime != null) {
                      String formattedTime =
                          '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}';
                      endtimeController.text = formattedTime;
                    }
                  },
                  child: Text('Select End Time'),
                ),
                TextFormField(
                  controller: endtimeController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Appointment Ending Time',
                  ),
                  validator: RequiredValidator(
                      errorText: "Please select the end time"),
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
                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                        dateController.text = formatter.format(selectedDate!);
                        DateTime selectedDateTime = selectedDate as DateTime;
                        final String startTimeString =
                            dateController.text.toString() +
                                ' ' +
                                starttimeController.text;
                        final String endTimeString =
                            dateController.text.toString() +
                                ' ' +
                                endtimeController.text;
                        final Uri url = Uri.parse(
                            'http://10.0.2.2:5000/get_datetime_from_url/$startTimeString/$endTimeString/${idController.text}/${drroomController.text}');
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
                        print(
                            'The appointment is from ${startTimeString} until ${endTimeString}');
                        formkey.currentState!.reset();
                        //dateController.clear();
                        // timeController.clear();
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
