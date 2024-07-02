import 'dart:convert';

import 'package:app/walkin_patient.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = '';
  var data;
  String output = 'Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Flask App')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              onChanged: (value) {
                url = 'http://10.0.2.2:5000/api?query=' + value.toString();
              },
            ),
            TextButton(
                onPressed: () async {
                  // data = await fetchdata(url);
                  var decoded = jsonDecode(data);
                  setState(() {
                    output = decoded['output'];
                  });
                },
                child: Text(
                  'Fetch ASCII Value',
                  style: TextStyle(fontSize: 20),
                )),
            Text(
              output,
              style: TextStyle(fontSize: 40, color: Colors.green),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return WalkIn();
                        },
                      ));
                    },
                    child: const Text(
                      "Click Here",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 80, 3),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
