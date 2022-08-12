import 'package:flutter/material.dart';
import 'package:time_picker/Animation/animated.dart';
import 'package:time_picker/box_clock/new_box_clock.dart';

import '../custome_picker.dart';
import '../home_page.dart';
import '../third_try_clock/square_clock.dart';

class RouteGenerator{
  static Route<dynamic> generatedRoute(RouteSettings settings){

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder:(_) => const Home());

      case '/Date_time_picker':
        return MaterialPageRoute(builder: (_) => const DateTimePicker());
      case '/animation':
        return MaterialPageRoute(builder: (_) => SampleAnimation());

      case '/SquareClock':
        return MaterialPageRoute(builder: (_) => const SquareClock());

      case '/new_box_clock':
        return MaterialPageRoute(builder:(_) => const BoxClock());


      default:
        return error_route();
    }

  }
  static Route<dynamic> error_route(){
    return MaterialPageRoute(builder: (_){
      return Expanded(
          child:Container(
            color: Colors.red,
            child: const Center(
              child: Text('No route Found'),
            ),
          ) );
    });
  }
}