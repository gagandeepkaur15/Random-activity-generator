import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

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
  Color _color3 = Color.fromARGB(255, 85, 224, 192);

  void changeCol() {
    setState(() {
      if (change == false) {
        _color1 = Color.fromARGB(220, 0, 0, 0);
        _color2 = Colors.white;
        _color3 = Color.fromARGB(255, 85, 224, 192);
      } else {
        _color1 = Colors.white;
        _color2 = Color.fromARGB(220, 0, 0, 0);
        _color3 = Colors.purple;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //fetchData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: _color3,
          title: Center(
            child: Text(
              'Random Activity',
              style: TextStyle(color: _color1),
            ),
          ),
        ),
        body: Container(
          color: _color1,
          child: ListView(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
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
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [_color3, _color2],
                          ),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              //_color2,
                              Colors.transparent,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: fetchData,
                          child: Text(
                            'Click Me',
                            style: GoogleFonts.ubuntu(
                              color: _color1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Align(
                    child: SizedBox(
                      width: 150,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [_color3, _color2],
                          ),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              //_color2,
                              Colors.transparent,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                            style: GoogleFonts.ubuntu(
                              color: _color1,
                            ),
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
