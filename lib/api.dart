import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_detail_page.dart';

class APIExample extends StatefulWidget {
  @override
  _APIExampleState createState() => _APIExampleState();
}

var Data = [];

class _APIExampleState extends State<APIExample> {
  @override
  void initState() {
    getsearchList();
    // TODO: implement initState
    super.initState();
  }

  /*Future<List> getTimelineCommentList(postid, userid) async {
    final response = await http.get(
      Uri.encodeFull(
          "http://saasinfomedia.com/foodiz/public/api/commentslist?user_id=" +
              userid +
              "&post_id=" +
              postid),
    );
    var qData = json.decode(
      response.body,
    );
    return qData['comments'];
  }*/
  Future getsearchList() async {
    final api = await http.get(Uri.encodeFull(
        "http://brokerhidedemo2.capcee.com/api/search?user_id=181&lat=12.922637&lon=77.617444&prop_type=1&category=1"));
    var api_data = json.decode(api.body);
    setState(() {
      Data = api_data["data"];
    });
    print("DDDDATAAAAAAAA " + Data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API Example"),
        ),
        body: ListView.builder(
            itemCount: Data.length,
            itemBuilder: (context, index) {
              print("length " + Data.length.toString());
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>APIDetails(ind: index,Detail: Data,)
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(index.toString() +
                            ")  " +
                            Data[index]["name"].toString()),
                        SizedBox(
                          height: 3,
                        ),
                        Text(Data[index]["id"].toString())
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
