import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  Map UserList; 
  List users;
  Future setUser() async {
    String url = "https://reqres.in/api/users";
    http.Response response = await http.get(url);
    UserList =  json.decode(response.body); 
    setState(() {
     users =UserList["data"];
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User information"),
      ),
      body: ListView.builder(
        itemCount: users == null ? 0 : users.length,
        itemBuilder: (BuildContext context, int i){
          final UserName = users[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
             
              child: Container(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage("${UserName["avatar"]}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("${UserName["first_name"]}"),
                    ),
                  ],
                ),
              )
            ),
          );
      
          
          
        
        }
      ),
    );
  }
}