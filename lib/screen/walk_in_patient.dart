import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_4/screen/administrator.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_core/firebase_core.dart';

import '../model/info_patient_walkin.dart';

class WalkIn extends StatefulWidget {
  const WalkIn({super.key});

  @override
  State<WalkIn> createState() => _WalkInState();
}

class _WalkInState extends State<WalkIn> {
  final formkey = GlobalKey<FormState>();
  WalkInPatient myWalkInPatient = WalkInPatient(id: '', fname: '', age: '');
  //เตรียมfirebase
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _WalkInPatientCollection =
      FirebaseFirestore.instance.collection("walk-in_patient");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Form for Walk-in patient"),
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
                        Text(
                          "name",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please enter patient's name"),
                          onSaved: (String? fname) {
                            myWalkInPatient.fname = fname!;
                          },
                        ),
                        // SizedBox(
                        //   height: 15,
                        // ),
                        // Text(
                        //   "email",
                        //   style: TextStyle(fontSize: 20),
                        // ),
                        // TextFormField(
                        //   validator: MultiValidator([
                        //     EmailValidator(
                        //         errorText:
                        //             "Please enter a correct email format"),
                        //     RequiredValidator(
                        //         errorText: "Please enter your email")
                        //   ]),
                        //   onSaved: (String? email) {
                        //     myWalkInPatient.email = email!;
                        //   },
                        //   keyboardType: TextInputType.emailAddress,
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "age",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please enter patient's age"),
                          onSaved: (String? age) {
                            myWalkInPatient.age = age!;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "id",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please enter patient's id"),
                          onSaved: (String? id) {
                            myWalkInPatient.id = id!;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text(
                              "Save data",
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 24, 183, 141)),
                            ),
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                await _WalkInPatientCollection.add({
                                  "fname": myWalkInPatient.fname,
                                  "id": myWalkInPatient.id,
                                  "age": myWalkInPatient.age,
                                });
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
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
