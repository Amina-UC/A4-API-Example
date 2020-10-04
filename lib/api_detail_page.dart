import 'package:flutter/material.dart';

class APIDetails extends StatefulWidget {

  APIDetails({this.ind,this.Detail});
  int ind;
  List Detail;

  @override
  _APIDetailsState createState() => _APIDetailsState();
}

class _APIDetailsState extends State<APIDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(widget.Detail[widget.ind]["id"].toString()),
              SizedBox(height: 10,),
              Text(widget.Detail[widget.ind]["name"].toString()),
              SizedBox(height: 10,),
              Text(widget.Detail[widget.ind]["locality"].toString()),
              SizedBox(height: 10,),
              Text(widget.Detail[widget.ind]["locality"].toString()),
              SizedBox(height: 10,),
              Container(height: 45,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.Detail[widget.ind]["propertyAttribute"].length,
                    itemBuilder: (context,pro_index){
                      print("Property attribute length "+widget.Detail[widget.ind]["propertyAttribute"].length.toString());
                      return Container(
                        child: Text(widget.Detail[widget.ind]["propertyAttribute"][pro_index]["field_name"].toString()+" :- "+widget.Detail[widget.ind]["propertyAttribute"][pro_index]["value"].toString()),
                      );
                    }),
              )
             /* Text(widget.Detail[widget.ind]["propertyAttribute"][0]["field_name"].toString()+" :- "+widget.Detail[widget.ind]["propertyAttribute"][0]["value"].toString()),
              Text(widget.Detail[widget.ind]["propertyAttribute"][1]["field_name"].toString()+" :- "+widget.Detail[widget.ind]["propertyAttribute"][1]["value"].toString()),
              Text(widget.Detail[widget.ind]["propertyAttribute"][2]["field_name"].toString()+" :- "+widget.Detail[widget.ind]["propertyAttribute"][2]["value"].toString()),
*/
            ],
          ),
        ),
      ),
    );
  }
}
