import 'package:flutter/material.dart';
import 'package:sec_project_chatbot/SignIn/ripples.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List names = ['Exercises', 'Games', 'Music'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text("Home"),
        ),
        body: Column(

          children: [
            // RipplesAnimation(onPressed: () {}, child: Text("")),
            SizedBox(height: 30,),
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.yellow,
              child: SizedBox(
                child: Image.asset("assets/app logo large.png"),
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width*0.35,
              ),
            ),
            SizedBox(height: 10,),
            Text("Cheers!!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            Text("Welcome to this personal therapist", style: TextStyle(fontSize: 18),),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Container(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.2,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.17,
                      child: Card(
                        color: Color.fromRGBO(200, 120, 160, 10),
                        //clipBehavior: Clip.antiAliasWithSaveLayer,
                        // child: Text("${names[index]}"),
                        child: Center(
                          child: Container(
                              //padding: EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text(
                                '${names[index].toString()}',
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                )),
          ],
        ));
  }
}
