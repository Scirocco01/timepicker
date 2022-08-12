import 'dart:math';

import 'package:flutter/material.dart';
import 'package:time_picker/clock_view.dart';


class DateTimePicker extends StatefulWidget {
  const DateTimePicker({Key? key}) : super(key: key);


  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2D2F41),
      child: Transform.rotate(
          angle: -pi/180,
          child: ClockView()),

    );
  }
}
