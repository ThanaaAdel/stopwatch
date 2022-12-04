import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: counterDown(),
   debugShowCheckedModeBanner: false,
    );
  }
}

class counterDown extends StatefulWidget {
  const counterDown({Key? key}) : super(key: key);

  @override
  State<counterDown> createState() => _counterDownState();
}

class _counterDownState extends State<counterDown> {
  Timer? repetedfunction;
  bool isRunning = true;
  Duration duration = Duration(seconds: 0);
  startTimer() {
    repetedfunction = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        int newSecond = duration.inSeconds + 1;
        duration = Duration(seconds: newSecond);
        // int newminutes = duration.inMinutes+1;
        // duration = Duration(seconds: newminutes);
        // int newhours = duration.inHours+1;
        // duration = Duration(seconds: newhours);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title:Text("Stop Watch",style: TextStyle(fontSize: 30),) ,
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 22),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      duration.inHours.toString().padLeft(2, "0"),
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Text(
                    "Hours",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                width: 22,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 22),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      duration.inMinutes
                          .remainder(60)
                          .toString()
                          .padLeft(2, "0"),
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Text(
                    "Minutes",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                width: 22,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 22),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      duration.inSeconds
                          .remainder(60)
                          .toString()
                          .padLeft(2, "0"),
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Text(
                    "Seconds",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 55,
          ),

          Column(
            children: [
              isRunning?
              ElevatedButton(
                onPressed: () {
                  startTimer();
                  setState(() {
                    isRunning=false;
                  });
                },
                child: Text(
                  "Start Timer",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 25, 120, 197)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
              )

              :
              Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [


                  ElevatedButton(
                    onPressed: () {
                      if(repetedfunction!.isActive){
                        setState(() {
                          repetedfunction!.cancel();

                        });
                      }
                      else{
                        startTimer();
                      }
                    },
                    child: Text(
                      (repetedfunction!.isActive)?  "Stop" : "Resume",
                      style: TextStyle(fontSize: 19),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 25, 120, 197)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9))),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      repetedfunction!.cancel();
                      setState(() {
                        duration = Duration(seconds: 0);
                        isRunning=true;
                      });

                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 19),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 200, 20, 100)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9))),
                    ),)
                ],


              ),
            ],
          )
        ],
      ),
    );
  }
}
