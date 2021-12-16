// import 'package:flutter/material.dart';
// class profile extends StatefulWidget {
//   @override
//   _profileState createState() => _profileState();
// }
//
// class _profileState extends State<profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profiling"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Container(
//           child: Column(
//             children: [
//               SizedBox(height: 30,),
//               CircleAvatar(
//                 radius: 100,
//                 //backgroundColor: Colors.grey,
//                 backgroundImage: AssetImage("assets/dp.jpg"),
//               ),
//               SizedBox(height: 40,),
//               Text("user name:", style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500
//               ),),
//               TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'mahnoorhashmi4000@gmail.com',
//                 ),
//               ),
//               //Text("User name: Mahnoor", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
//               SizedBox(height: 30,),
//               Text("password:", style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500
//               ),),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: '********',
//                 ),
//               ),
//               Align(child: FlatButton(child: Text("change pass"), onPressed: (){},), alignment: Alignment.centerRight),
//
//               //Text("Password: *******", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
//             ],
//           )
//         ),
//       ),
//     );
//   }
// }
// import 'package:chat_app/authentication/Registration.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sec_project_chatbot/Screens/SignIn/ripples.dart';
class Profile_data {
  String LastName;
  String firstName;
  Profile_data(this.LastName, this.firstName);
}

class owner extends StatefulWidget {
  const owner({Key? key}) : super(key: key);
  @override
  _ownerState createState() => _ownerState();

// class owner extends StatelessWidget {
//   const owner({Key key}) : super(key: key);
//   @override
//   _ownerState createState() => _ownerState();
}

class _ownerState extends State<owner> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text('Profile'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.24,
              color: Colors.purple[50],
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.01,
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            "assets/dp.jpg"),
                        radius: 60,
                      ),
                      Positioned(
                          bottom: 0,
                          left: 55,
                          child: RawMaterialButton(
                            onPressed: () {},

                            // elevation: 2.0,
                            fillColor: Color.fromRGBO(200, 140, 160, 10),

                            child: Icon(
                              Icons.edit,
                              size: 20,
                            ),
                            padding: EdgeInsets.all(5),
                            shape: CircleBorder(),
                          ))
                      // FloatingActionButton(

                      //   mini: true,
                      //   onPressed: (){},
                      //   child: Icon(Icons.edit), )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.01,
                  ),
                  Text(
                    'Mahnoor Hashmi',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.005,
                  ),
                  Text('+92 311 5953044')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                  width: double.infinity,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.5,
                  child: Column(
                    children: [
                      FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: Color.fromRGBO(200, 120, 160, 20),
                            ),
                            title: Text('Account')),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            leading: Icon(
                              Icons.account_tree_outlined,
                              color: Color.fromRGBO(200, 120, 160, 20),
                            ),
                            title: Text('Chat Analysis')),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            leading: Icon(
                              Icons.chat,
                              color: Color.fromRGBO(200, 120, 160, 20),
                            ),
                            title: Text('Invite a friend')),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            leading: Icon(
                              Icons.help_outline_outlined,
                              color: Color.fromRGBO(200, 120, 160, 20),
                            ),
                            title: Text('Help')),
                      ),
                      FlatButton(
                        onPressed: () async {
                          //await signout();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ripples()),
                          );
                        },
                        child: ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: Color.fromRGBO(200, 120, 160, 20),
                            ),
                            title: Text('Log out')),
                      ),
                    ],
                  )),
            )
          ],
        ),
      );
}