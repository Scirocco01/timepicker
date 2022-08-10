import 'dart:math';

import 'package:flutter/material.dart';

class ClockDialPainter extends CustomPainter{
  final clockText;

  final hourTickMarkLength= 10.0;
  final minuteTickMarkLength = 5.0;

  final hourTickMarkWidth= 3.0;
  final minuteTickMarkWidth = 1.5;

  final Paint tickPaint;
  final TextPainter textPainter;
  final TextStyle textStyle;



  ClockDialPainter({this.clockText= ClockText.roman})
      :tickPaint= Paint(),
        textPainter= TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
        textStyle= const TextStyle(
          color: Colors.black,

          fontSize: 15.0,
        )
  {
    tickPaint.color= Colors.blueGrey;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var centerx = size.width;

    var centery = size.height;
    print(centery);
    var center = Offset(centerx, centery);

    var tickMarkLength;
    final angle= 2 * pi / 60;
    final radius= size.width;
    canvas.save();


    var secHandBrush = Paint()
      ..color = Color(0xFFFF8A65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10

      ..strokeCap = StrokeCap.round;

    var value =1;
    
    

    var secHandX = centerx + 130 * cos(value* 30 * pi / 180);
    // = 260
    var secHandY = centery + 130 * sin(value * 30 * pi / 180);
    // = 130
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    canvas.save();






    if(value ==12){
      print('the time is 12');
    }
    else if(value >12){
      print('the time is ${value - 12}');
    }
    else{
      print('the time is ${value + 3}');
    }

    canvas.translate(radius, radius);
    for (var i = 0; i< 60; i++ ) {


      tickMarkLength = i % 5 == 0 ? hourTickMarkLength: minuteTickMarkLength;
      tickPaint.strokeWidth= i % 5 == 0 ? hourTickMarkWidth : minuteTickMarkWidth;
      canvas.drawLine(
          new Offset(0.0, -radius), new Offset(0.0, -radius+tickMarkLength), tickPaint);



      if (i % 5 == 0){
        canvas.save();
        canvas.translate(0.0, -radius+20.0);

        textPainter.text= TextSpan(
          text: '${i == 0 ? 12 : i~/5}'
          ,
          style: textStyle,
        );


        canvas.rotate(-angle*i);

        textPainter.layout();


        textPainter.paint(canvas, new Offset(-(textPainter.width/2), -(textPainter.height/2)));

        canvas.restore();

      }

      canvas.rotate(angle);
    }

    canvas.restore();
    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

enum ClockText{
  roman,
  arabic
}