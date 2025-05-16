
import 'package:flutter/material.dart';

class ExerciseWeek1 extends StatelessWidget{
  const ExerciseWeek1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _iconButton(Icons.arrow_back),
                    _iconButton(Icons.edit),
                  ],
                ),
                const SizedBox(height: 250),
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Nguyen Minh Truc - CN22D',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8,),
                const Text(
                  'Qua môn học lập trình mobile',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget _iconButton(IconData icon){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        shape: BoxShape.circle,
      ),
      child: IconButton(
          onPressed: (){},
          icon: Icon(icon, color: Colors.black,)),
    );
  }
}

