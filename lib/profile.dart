import 'package:flutter/material.dart';
class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profiling"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 30,),
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.grey,
              ),
              SizedBox(height: 40,),
              Text("User name: Mahnoor", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              SizedBox(height: 30,),
              Text("Password: *******", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
            ],
          )
        ),
      ),
    );
  }
}
