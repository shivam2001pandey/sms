import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stock_management/search.dart';
import 'package:stock_management/stockdetails.dart';

import 'home.dart';



class ItemList extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return ItemListState();
  }
}

class ItemListState extends State<ItemList> {
  

  StreamSubscription<DocumentSnapshot> subscription;
  final db = Firestore.instance;

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()=>Future.value(false),
          child: Scaffold(
        appBar: AppBar(
          title: Text("Items List"),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Screen1()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text("Main Screen"),
            ),
            IconButton(
               icon: Icon(
                 Icons.search,
                 color:Colors.white,
               ),
              onPressed:(){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage(),
                  
                ));
                },
             ),
             
              
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('MasterData').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');
              default:
               

                return new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return Card(
                      elevation: 8.0,
                      child: new ListTile(
                        title: new Text('${document['Name']}'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 25.0,
                        ),
                        contentPadding: EdgeInsets.all(20.0),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return StockDetails(
                             
                              document['Name'],
                              document['Category'],
                              document['Quantity'],
                              document['Location'],
                              document['value']
                            );
                          }));
                        },
                      ),
                    );
                  }).toList(),
                );
            }
          },
        ),
      ),
    );
  }
}