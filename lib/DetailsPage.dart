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
      )
    );
  }
}
