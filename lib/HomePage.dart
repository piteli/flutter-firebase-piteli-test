import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference = Firestore.instance.collection("TopPost");

  @override
  void initState(){

    subscription = collectionReference.snapshots().listen(datasnapshot){
      setState(() {
        snapshot = datasnapshot.documents;
      });
    };

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title : new Text("Firebase Backend App"),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: () => debugPrint("Search")),
          new IconButton(icon: new Icon(Icons.add), onPressed: () => debugPrint("Add")),
        ],
      ),
      drawer: new Drawer(
        child : new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName : new Text("Code with YDC"),
              accountEmail : new Text("ydc@gmail.com"),
              decoration : new BoxDecoration(
                color : Colors.purple
              )
            ),
            new ListTile(
              title : new Text("First page"),
              leading : new Icon(Icons.search, color : Colors.green),
            ),
            new ListTile(
              title : new Text("Second page"),
              leading : new Icon(Icons.add, color : Colors.purple),
            ),
            new ListTile(
              title : new Text("Third page"),
              leading : new Icon(Icons.cake, color : Colors.redAccent),
            ),
            new Divider(
              height : 10.0,
              color : Colors.black,
            ),
            new ListTile(
              title : new Text("close"),
              trailing : new Icon(Icons.close),
              onTap: (){
                Navigator.of(context).pop()
              },
            )
          ]
        )
      ),
      body : new ListView(
        children : <Widget>[
          new Container(
            height : 200,
            child : new ListView.builder(
              itemCount: snapshot.length,
              itemBuilder: (context, index){
                return Card(
                  elevation: 10.0,
                    margin : EdgeInsets.all(10.0),
                    child: new Container(
                        margin : EdgeInsets.all(10.0),
                        child : new Column(
                            children : <Widget>[
                              new ClipRReact(
                                borderRadius : new BorderRadius.circular(10.0),
                                child : new Image.network(snapshot[index].data["url"],
                                  height : 120.0,
                                  width : 120.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              new SizedBox(height : 10.0,),
                              new Text(snapshot[index].data["title"]),
                              style : TextStyle(fontSize : 19.0, color : Colors.purple)
                            ]
                        )
                )
                )
              },
            )
          )
        ]
      )
    );
  }
}
