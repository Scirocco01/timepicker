


import 'dart:math';

import 'package:flutter/material.dart';

class SecTick extends CustomPainter{
  final clockText;

  final hourTickMarkLength= 10.0;
  final minuteTickMarkLength = 5.0;

  final hourTickMarkWidth= 3.0;
  final minuteTickMarkWidth = 1.5;

  final Paint tickPaint;
  final TextPainter textPainter;
  final TextStyle textStyle;



 SecTick({this.clockText= ClockText.roman})
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
    var centerx = size.width/2;

    var centery = size.height/2;
    print(centery);
    var center = Offset(centerx, centery);

    var tickMarkLength;
    final angle= 2 * pi / 60;
    final radius= size.width;
    canvas.save();





    canvas.translate(radius, radius);
    for (var i = 0; i< 60; i++ ) {


      tickMarkLength = i % 5 == 0 ? hourTickMarkLength: minuteTickMarkLength;
      tickPaint.strokeWidth= i % 5 == 0 ? hourTickMarkWidth : minuteTickMarkWidth;
      canvas.drawLine(
          Offset(0.0, -radius), Offset(0.0, -radius+tickMarkLength), tickPaint);



      if (i % 5 == 0){
        canvas.save();
        canvas.translate(0.0, -radius+20.0);

        textPainter.text= TextSpan(
          text: '${i == 0 ? 60 : i~/1}',

          style: textStyle,
        );


        canvas.rotate(-angle*i);

        textPainter.layout();


        textPainter.paint(canvas, Offset(-(textPainter.width/2), -(textPainter.height/2)));

        canvas.restore();

      }

      canvas.rotate(angle);
    }

    canvas.restore();


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

enum ClockText{
  roman,
  arabic

}