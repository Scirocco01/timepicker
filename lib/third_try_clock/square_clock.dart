import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

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
  firstletter(double value){
    var name = value.toString();
    // if(value > 9){
    //    return name.selectMultiple([1,3]).join(',');
    // }

    return name[0];
  }
  secondletter(double value){
    var name = value.toString();
    return name[1];
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
            Text('Select Time '),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Center(
                child: Row(
                  children:[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.lightBlueAccent,
                    ),
                    child: Center(

                        child:

                        Text('${firstletter(lXvalue)}',style: TextStyle(fontSize: 40),)),

                  ),
                    Text(':',style: TextStyle(fontSize: 50),),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.lightBlueAccent,
                      ),
                      child:   Center(child: Text('00',style: TextStyle(fontSize: 40),)),

                    ),
                    SizedBox(width: 10,),
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
                    Center(
                        child: Container(
                            height: 280,
                            width: 280,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: Stack(children: [
                              Transform.rotate(
                                angle:  - 1.5708,
                                child: Container(
                                  width: 300,
                                  height: 300,
                                  padding: const EdgeInsets.all(10.0),
                                  child: CustomPaint(
                                    painter: Needle(xvalue: lXvalue, yvalue: lyvalue),
                                  ),
                                ),
                              ),
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
  }
}

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
    var center = Offset(centerx, centery);

    var secHandBrush = Paint()
      ..color = Color(0xFFFF8A65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round;

    var secHandX =centerx + 130 * cos(xvalue * 30 * pi / 180);
    var secHandY = centerx + 130 * sin(yvalue * 30 * pi / 180);

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    print('this is sec x value $secHandX , this is sec y value $secHandY');
    canvas.rotate(1.99);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
