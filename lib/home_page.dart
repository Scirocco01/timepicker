import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _showtimepicker(){
    showTimePicker(
        context: context,
        initialTime:TimeOfDay.now());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              MaterialButton(
                color: Colors.blueGrey,
                onPressed:(){
                  Navigator.pushNamed(context,'/Date_time_picker');
                },

                child: const Text('Custom'),),
              const SizedBox(
                height: 100,
              ),
              MaterialButton(
                color: Colors.blueGrey,
                onPressed:(){
                  Navigator.pushNamed(context,'/new_box_clock');
                },

                child: const Text('BoxClock'),),
              const SizedBox(
                height: 100,
              ),



              MaterialButton(
                color: Colors.blueGrey,
                onPressed:_showtimepicker,

                child: Text('pick time'),),
            ],
          ),
        ),

      ),
    );
  }
}
