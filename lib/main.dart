import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  bool change = false;
  Color _color1 = Color.fromARGB(220, 0, 0, 0);
  Color _color2 = Colors.white;

  void changeCol() {
    setState(() {
      if (change == false) {
        _color1 = Color.fromARGB(220, 0, 0, 0);
        _color2 = Colors.white;
      } else {
        _color1 = Colors.white;
        _color2 = Color.fromARGB(220, 0, 0, 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //fetchData();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Random Activity',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Container(
          color: _color1,
          child: ListView(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 500,
                  child: Text(
                    activity,
                    style: GoogleFonts.combo(fontSize: 20, color: _color2),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    child: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            _color2,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: fetchData,
                        child: Text(
                          'Click Me',
                          style: TextStyle(
                            color: _color1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Align(
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            _color2,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          change = !change;
                          changeCol();
                        },
                        child: Text(
                          'Change Theme',
                          style: TextStyle(
                            color: _color1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
