import 'package:flutter/material.dart';
import 'package:memes/view/mainScreen.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 168, 224, 222),
        body: Center(
      child: Container(
        height: 300,
        width: 120,
        child: Column(
          children: [
            Image.asset(
              "images/one.jpg",
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "MemePlexes",
              
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
           
          ],
        ),
      ),
    ));
  }
}
