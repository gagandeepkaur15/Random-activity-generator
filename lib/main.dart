import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final url = "http://www.boredapi.com/api/activity/";
  var activity = "";

  void fetchData() async {
    try {
      final response = await get(Uri.parse(url));
      final data = jsonDecode(response.body) as Map;
      //activity = data['activity'] as String;

      setState(() {
        activity = data['activity'] as String;
      });
    } catch (error) {
      print(error);
    }
  }

  // void click() {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    //fetchData();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(
            child: Text(
              'Random Activity',
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              height: 500,
              child: Text(
                activity,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Align(
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.black,
                    ),
                  ),
                  onPressed: fetchData,
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
