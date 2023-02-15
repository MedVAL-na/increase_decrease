import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    //TODO implement state
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late bool _loading;
  late double _progressValue;

  @override
  void initState() {
    _loading = false;
    _progressValue = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Coolest App"),
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: _loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearProgressIndicator(
                          value: _progressValue, color: Colors.green),
                      Text(
                        '${(_progressValue * 100).round().toString()}%',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )
                : const Text(
                    'Press button to download',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
          ),
        ),
        backgroundColor: Colors.green.shade300,
        drawer: const Drawer(
          backgroundColor: Colors.greenAccent,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "This is my first app",
              style: TextStyle(
                fontSize: 26,
                color: Colors.green,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          backgroundColor: Colors.greenAccent,
          child: const Icon(Icons.person_2_sharp, color: Colors.green),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.01;
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
