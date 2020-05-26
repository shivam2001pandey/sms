import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stock_management/search.dart';
import 'package:stock_management/viewdetails.dart';

class ViewList extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return ViewListState();
  }
}

class ViewListState extends State<ViewList> {
  

  StreamSubscription<DocumentSnapshot> subscription;
  final db = Firestore.instance;

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Items List"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          
           IconButton(
             icon: Icon(
               Icons.search,
               color:Colors.white,
             ),
            onPressed:(){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage(),
                
              ));},
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
                        debugPrint(document['Name']);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ViewDetails(
                           
                            document['Name'],
                            document['Category'],
                            document['Quantity'],
                            document['Location'],
                            document['value'],
                            document['Total Value']
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
    );
  }
}