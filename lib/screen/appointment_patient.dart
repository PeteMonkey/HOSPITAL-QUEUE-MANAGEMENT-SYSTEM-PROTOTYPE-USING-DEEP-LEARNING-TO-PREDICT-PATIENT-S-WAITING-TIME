import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppointmentPatient extends StatefulWidget {
  const AppointmentPatient({super.key});

  @override
  State<AppointmentPatient> createState() => _AppointmentPatientState();
}

class _AppointmentPatientState extends State<AppointmentPatient> {
  // final formkey = GlobalKey<FormState>();
  // WalkInPatient myWalkInPatient = WalkInPatient(id: '', fname: '', age: '');
  // //เตรียมfirebase
  // final Future<FirebaseApp> firebase = Firebase.initializeApp();
  // CollectionReference _WalkInPatientCollection =
  //     FirebaseFirestore.instance.collection("walk-in_patient");

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
