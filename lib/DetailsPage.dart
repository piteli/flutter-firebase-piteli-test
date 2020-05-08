import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsPage extends StatefulWidget {

  DocumentSnapshot snapshot;

  DetailPage({this.snapshot});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar : new AppBar(
        title : new Text("Post Details"),
        backgroundColor : Colors.green
      ),
      body : new ListView(
        children : <Widget>[
          new Container(
            margin : EdgeInsets.all(5.0),
            child : new Card(
                elevation : 9.0,
                child : new Container(
                    padding : EdgeInsets.all(10.0),
                    child : new Row(
                        children : <Widget>[
                          new CircleAvatar(
                            child: new Text(widget.snapshot.data['title'][0]),
                            backgroundColor : Colors.green,
                            foregroundColor : Colors.white,
                          ),
                          new SizedBox(width : 10.0,),
                          new Text(widget.snapshot.data["title"]),
                          style : TextStyle(fontSize : 21.0, color : Colors.green)
                        ]
                    )
                )
            )
          )
        ]
      )
    );
  }
}
