import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:time_picker/third_try_clock/second_tick_painter.dart';

import 'needle_pianter.dart';

class SquareClock extends StatefulWidget {
  const SquareClock({Key? key}) : super(key: key);

  @override
  State<SquareClock> createState() => _SquareClockState();
}

class _SquareClockState extends State<SquareClock> {

  // @override
  // void initState() {
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     setState(() {}
  //     );
  //   });
  //
  //   super.initState();
  // }
  var lXvalue = 0.0;
  var lyvalue =0.0;
  var hourVisible = true;
  var secVisible = false;


  var angle = 0.0;
  var timerHour;
  var timerSec;

  var finalHourValue = 12;
  var finalSecValue = 0;

  radToDegHour(double value){
    timerHour= value * 180/pi;
    timerHour = timerHour/30;
    timerHour.round();
    if(timerHour>12){
      timerHour.round() - 12;
      setState((){
        finalHourValue = timerHour.round();
      });
      return timerHour.round();
    }
    else {
      setState((){
        finalHourValue = timerHour.round();
      });
      return timerHour.round();
    }
  }
  
  radToDegSec(double value){
    timerSec =  value * 180/pi;

    timerSec = timerSec/6;
    if(timerSec.round()>59){
       timerSec = timerSec.round()  - 60;
      setState((){
        finalSecValue = timerSec.round();
      });
        return timerSec.round();
    }
    else{
      setState((){
        finalSecValue = timerSec.round();
      });
      return timerSec.round();
    }
  }





  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('back'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10,left: 200,right: 200,bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,

          children: [
            const Text('Select Time '),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Center(
                child: Row(
                  children:[
                  GestureDetector(
                    onTap:(){
                      setState((){
                        hourVisible = true;
                        secVisible =false;
                        lXvalue  = finalHourValue.toDouble() ;
                        print('lxvalue = ${lXvalue}');
                        lyvalue = finalHourValue.toDouble() ;
                        print('lyvalue = ${lyvalue}');

                      });
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.lightBlueAccent,
                      ),
                      child: Center(

                          child:
                          hourVisible?
                          Visibility(
                              visible: hourVisible,
                              child: Text('${radToDegHour(angle)}',style: TextStyle(fontSize: 40),)):
                          Text('${finalHourValue}',style: TextStyle(fontSize: 40),)

                    ),

                    ),
                  ),
                    Text(':',style: TextStyle(fontSize: 50),),
                    GestureDetector(
                      onTap:(){
                      setState((){
                        if(secVisible){secVisible = false;}
                        else{secVisible = true;}
                        hourVisible = false;
                        lXvalue  = finalSecValue.toDouble() ;
                        print('lxvalue = ${lXvalue}');
                        lyvalue = finalSecValue.toDouble() ;
                        print('lyvalue = ${lyvalue}');
                      });
                        print('onvisible taop');
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.lightBlueAccent,
                        ),
                        child:
                        secVisible?
                        Visibility(
                          visible: secVisible,
                            child: Center(child: Text('${radToDegSec(angle)}',style: TextStyle(fontSize: 40),))
                        ): Center(child: Text('${finalSecValue}',style: TextStyle(fontSize: 40)))

                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      height: 140,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.lightBlueAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top:10,bottom: 10),
                        child: Column(
                          children: const [
                            Text('AM',style: TextStyle(fontSize: 30),),
                           Spacer(),
                            Text('PM',style: TextStyle(fontSize: 30,color: Colors.black12),),
                          ],
                        ),
                      ),

                    ),

                    ]

                ),
              ),
            ),
           SizedBox(
             height: MediaQuery.of(context).size.height * 0.03,
           ),

               Container(
                height: MediaQuery.of(context).size.height * 0.59,
                width:  MediaQuery.of(context).size.height * 0.59,

                child: Stack(
                  children: [
                  Visibility(
                      visible:hourVisible, 
                      child: Stack(
                    children: [
                      Listener(
                          onPointerDown: (PointerDownEvent event) {
                            setState(() {
                              lXvalue = 0;
                              lyvalue = 0;
                            });

                          },
                          child: const Dials(
                            txt: '12',
                            x: 0.0,
                            y: -0.84,
                          )),

                      Listener(
                          onPointerDown: (PointerDownEvent event) {
                            setState(() {
                              lXvalue =1;
                              lyvalue = 1;
                            });

                          },
                          child: const Dials(
                            txt: '1',
                            x: 0.38,
                            y: -0.74,
                          )),


                      Listener(

                          onPointerDown: (PointerDownEvent event) {
                            setState(() {
                              lXvalue = 2;
                              lyvalue = 2;
                            });
                            print(
                                "Global 2 position x:${event.position.dx}, y:${event.position.dy}");
                            print(
                                "Relative 2 position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                          },
                          child:const Dials(
                            txt: '2',
                            x: 0.671,
                            y: -0.45,
                          )),


                      Listener(
                        onPointerDown: (PointerDownEvent event) {
                          setState(() {
                            lXvalue =3;
                            lyvalue = 3;
                          });
                          print(
                              "Global 3 position x:${event.position.dx}, y:${event.position.dy}");
                          print(
                              "Relative 3 position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                        },
                        child: const Dials(
                          txt: '3',
                          x: 0.78,
                          y: -0.0,
                        ),
                      ),


                      Listener(
                        onPointerDown: (PointerDownEvent event) {
                          setState(() {
                            lXvalue =4;
                            lyvalue = 4;
                          });
                          print(
                              "Global 3 position x:${event.position.dx}, y:${event.position.dy}");
                          print(
                              "Relative 3 position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                        },
                        child:const Dials(
                          txt: '4',
                          x: 0.671,
                          y: 0.48,
                        ),),


                      Listener(
                        onPointerDown: (PointerDownEvent event) {
                          setState(() {
                            lXvalue =5;
                            lyvalue = 5;
                          });
                          print(
                              "Global 5 position x:${event.position.dx}, y:${event.position.dy}");
                          print(
                              "Relative 5 position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                        },
                        child:const Dials(
                          txt: '5',
                          x: 0.38,
                          y: 0.74,
                        ),),


                      Listener(
                          onPointerDown: (PointerDownEvent event) {
                            setState(() {
                              lXvalue =6;
                              lyvalue = 6;
                            });
                            print(
                                "Global 6 position x:${event.position.dx}, y:${event.position.dy}");
                            print(
                                "Relative 6 position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                          },
                          child: const Dials(
                            txt: '6',
                            x: 0.0,
                            y: 0.84,
                          ) ),


                      Listener(
                          onPointerDown: (PointerDownEvent event) {
                            setState(() {
                              lXvalue =7;
                              lyvalue = 7;
                            });
                            print(
                                "Global 7 position x:${event.position.dx}, y:${event.position.dy}");
                            print(
                                "Relative 7 position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                          },
                          child:const Dials(
                            txt: '7',
                            x: -0.38,
                            y: 0.74,
                          )),

                      Listener(
                          onPointerDown: (PointerDownEvent event) {
                            setState(() {
                              lXvalue =8;
                              lyvalue = 8;
                            });
                            print(
                                "Global 8 position x:${event.position.dx}, y:${event.position.dy}");
                            print(
                                "Relative 8 position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                          },
                          child:const Dials(
                            txt: '8',
                            x: -0.671,
                            y: 0.48,
                          ) ),

                      Listener(
                          onPointerDown: (PointerDownEvent event) {
                            setState(() {
                              lXvalue =9;
                              lyvalue = 9;
                              angle =  6.283;
                            });
                            print(
                                "Global 9 position x:${event.position.dx}, y:${event.position.dy}");
                            print(
                                "Relative 9 position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                          },
                          child:const Dials(
                            txt: '9',
                            x: -0.78,
                            y: -0.0,
                          ) ),


                      Listener(
                          onPointerDown: (PointerDownEvent event) {
                            setState(() {
                              lXvalue =10;
                              lyvalue = 10;
                            });
                            print(
                                "Global 10 position x:${event.position.dx}, y:${event.position.dy}");
                            print(
                                "Relative 10 position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                          },
                          child:const Dials(
                            txt: '10',
                            x: -0.671,
                            y: -0.48,
                          ) ),

                      Listener(
                          onPointerDown: (PointerDownEvent event) {
                            setState(() {
                              lXvalue =11;
                              lyvalue = 11;
                            });
                            print(
                                "Global 11 position x:${event.position.dx}, y:${event.position.dy}");
                            print(
                                "Relative 11 position: x:${event.localPosition.dx}, y:${event.localPosition.dy}");
                          },
                          child: const Dials(
                            txt: '11',
                            x: -0.38,
                            y: -0.74,
                          )),
                    ],
                  )),
                    Center(
                        child: Container(
                            height: 280,
                            width: 280,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: Stack(children: [

                                 Visibility(
                                   visible: secVisible,
                                   child: Container(
                                    height: 150,
                                    width: 150,
                                    padding: EdgeInsets.all(10.0),
                                    child: CustomPaint(
                                    painter: SecTick(),
                                    ),

                                ),
                                 ),


                              Transform.rotate(
                                origin:  Offset(0, 0),
                                angle:  - 1.5708 + angle,
                               child: GestureDetector(
                                  onPanUpdate: (dragUpdateDetails) {
                                     setState((){
                                       angle = angle + 0.01743;
                                       //2mints
                                       print('angle = $angle');
                                     }); //bloc event to update the position of draggable object as per your convenience
                                  },
                                    child: Container(
                                      width: 300,
                                       height: 300,

                                       padding: const EdgeInsets.all(10.0),
                                       child: CustomPaint(
                                          painter: Needle(xvalue: lXvalue, yvalue: lyvalue),
                                  ),
                                ),
                              ),),

                              Center(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),

                            ]))),
                    // Center Circle
                  ],
                ),
              ),

          ],
        ),
      ),
    );
  }}

class Dials extends StatefulWidget {
  const Dials({
    Key? key,
    required this.txt,
    this.x,
    this.y,
  }) : super(key: key);
  final txt;
  final x;
  final y;

  @override
  State<Dials> createState() => _DialsState();
}

class _DialsState extends State<Dials> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(widget.x, widget.y),
      child: Clock_dials(
        text: widget.txt,
      ),
    );
  }
}

class Clock_dials extends StatefulWidget {
  const Clock_dials({
    Key? key,
    this.text,
  }) : super(key: key);
  final text;

  @override
  State<Clock_dials> createState() => _Clock_dialsState();
}

class _Clock_dialsState extends State<Clock_dials> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Text(
        widget.text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class Needle extends CustomPainter {
  final xvalue;
  final yvalue;

  Needle({this.xvalue, this.yvalue});

  @override
  void paint(Canvas canvas, Size size) {
    var centerx = size.width / 2;
    var centery = size.height / 2;
    print('center x = ${centerx}, center y = ${centery}');
    var center = Offset(centerx, centery);
    print(center);

    var secHandBrush = Paint()
      ..color = Color(0xFFFF8A65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round;

    var secHandX =centerx + 130 * cos(xvalue * 30 * pi / 180);
    var secHandY = centerx + 130 * sin(yvalue * 30 * pi / 180);

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    print('this is sec x value $xvalue , this is sec y value $yvalue');
    canvas.rotate(1.99);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
