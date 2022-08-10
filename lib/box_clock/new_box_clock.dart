import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:time_picker/box_clock/dial_paint.dart';

class BoxClock extends StatefulWidget {
  const BoxClock({Key? key}) : super(key: key);

  @override
  State<BoxClock> createState() => _BoxClockState();
}

class _BoxClockState extends State<BoxClock> {
  // @override
  // void initState() {
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {});
  //   });
  //
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.blue,

          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Center(child: Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),),
                      Listener(
                        onPointerDown: (PointerDownEvent event){
                          print("Global position x:${event.position.dx}, y:${event.position.dy}");
                          print("Relative position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                        },
                        child: Container(
                          width:150,
                          height:150,
                          padding: const EdgeInsets.all(10.0),
                          child:CustomPaint(
                              painter: ClockDialPainter(),
                            ),

                        ),
                      ),

                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

