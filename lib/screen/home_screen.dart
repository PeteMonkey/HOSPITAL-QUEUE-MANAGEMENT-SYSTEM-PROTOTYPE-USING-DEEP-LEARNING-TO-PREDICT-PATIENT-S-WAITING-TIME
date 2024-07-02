// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/screen/administrator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //text controller
  //Map<String, dynamic> userMap;
  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();
  final TextEditingController _search = TextEditingController();

  bool isLoading = false;

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    await _firestore
        .collection('patient')
        .where("ID", isEqualTo: _search.text)
        .get()
        .then((value) {
      //userMap = value.doc[0].data();
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _paswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: isLoading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(
                    value: 1.1,
                    semanticsLabel: 'Circular progress indicator',
                  ),
                ),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 65,
                        ),
                        const Icon(
                          Icons.local_hospital,
                          size: 120,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        //Hello Again
                        const Text(
                          "Hello there!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Welcome to Electrical Engineering Hospital",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Search for your queue right here",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 30),
                        //email textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextField(
                                controller: _search,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your patient ID",
                                ),
                              ),
                            ),
                          ),
                        ),
                        //password textfiel
                        // sign in button
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: GestureDetector(
                            onTap: null,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 24, 183, 141),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Center(
                                  child: Text(
                                "Search",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //not a member?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return AdminPage();
                                    },
                                  ));
                                },
                                child: const Text(
                                  "For Administrator",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 80, 3),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }
}
