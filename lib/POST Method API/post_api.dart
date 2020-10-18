import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostApi extends StatefulWidget {
  @override
  _PostApiState createState() => _PostApiState();
}
var dataUser;
class _PostApiState extends State<PostApi> {

  Future RegisterUser(name,username,email,mobile,gender,birth,password) async {
    final String url = "http://saasinfomedia.com/foodiz/public/api/register";
    final register = await http.post(url, body: {
      "name": name.toString(),
      "email": email.toString(),
      "password": password.toString(),
      "mobile": mobile.toString(),
      "gender": gender.toString(),
      "dob": birth,
      "username": username.toString(),
    });
    dataUser = json.decode(register.body);
    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQQQ"+dataUser.toString());
  }
String dob="1997 - 10 - 10";
  TextEditingController name =TextEditingController();
  TextEditingController username =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController mobile =TextEditingController();
  TextEditingController gender =TextEditingController();
  TextEditingController password =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST Method"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Name"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: username,
                decoration: InputDecoration(
                    hintText: "User name"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: mobile,
                decoration: InputDecoration(
                    hintText: "Mobile Num"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "Email"
                ),
              ),
              SizedBox(height: 15,),
              Text(dob),
              SizedBox(height: 15,),
              TextField(
                controller: gender,
                decoration: InputDecoration(
                    hintText: "Gender"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: password,
                decoration: InputDecoration(
                    hintText: "Password"
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: (){
          RegisterUser(name.text,username.text,email.text,mobile.text,gender.text,dob,password.text);
        },
        child: Text("Submit"),
      ),
    );
  }
}
