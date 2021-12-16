import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sec_project_chatbot/Screens/SignIn/ripples.dart';
import 'ChatMessage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constants.dart';
class chat extends StatefulWidget {
  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  final _messageFieldController = TextEditingController();
  List<ChatMessage> messages = [
    ChatMessage("Hello! how are you?", "receiver"),
    ChatMessage("I'm not feeling good", "sender"),
    ChatMessage("Don't worry I'm here to help you", "receiver"),
    ChatMessage("What's wrong?", "receiver"),
  ];
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //bool enterIsSend = _prefs.getBool(SharedPreferencesHelpers.enterIsSend) ?? SharedPreferencesHelpers.defaultEnterIsSend;

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('dd-MM-yyyy');
  String formatted = formatter.format(now);

  Widget _showDialogueBox(ChatMessage msg){
    return SimpleDialog(
      title: Text('Message Details'),
      children:[
        SimpleDialogOption(
          onPressed: () {},
          child: Text(formatted),
        ),
        SimpleDialogOption(
          onPressed: () {
            setState(() {
              messages.remove(msg);
            });
            Navigator.pop(context);
          },
          child: const Text('Delete Message'),
        ),
        SimpleDialogOption(
          onPressed: () {},
          child: Text('Star Message'),
        ),
      ],
      elevation: 10,
      //backgroundColor: Colors.green,
    );
  }
  void choiceAction(String choice){
    if(choice == Constants.Settings){
      print('Settings');
    }else if(choice == Constants.DelChat){
      setState(() {
        messages.removeRange(0, messages.length);
      });
    }else if(choice == Constants.SignOut){
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context) => ripples()));
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/app logo panda.png"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Panda",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                // IconButton(
                //   icon: Icon(Icons.view_headline_sharp),
                //   color: Colors.white, onPressed: () {
                //     setState(() {
                //
                //     });
                //
                // },
                // ),
                PopupMenuButton<String>(
                  onSelected: choiceAction,
                  itemBuilder: (BuildContext context){
                    return Constants.choices.map((String choice){
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                )
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 200,
            child: SingleChildScrollView(
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = messages[index];
                  return Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: GestureDetector(
                        onLongPress: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Expanded(
                                child: _showDialogueBox(item),
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messages[index].messageType == "receiver"
                                ? Colors.grey.shade400
                                : Color.fromRGBO(200, 120, 160, 10)),
                          ),
                          padding: EdgeInsets.all(16),
                              child: Text(
                            messages[index].messageContent,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(200, 120, 160, 10),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _messageFieldController,
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        ChatMessage msg = new ChatMessage(_messageFieldController.text, "sender");
                        messages.add(msg);
                        _messageFieldController.clear();
                      });
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Color.fromRGBO(200, 120, 160, 10),
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

