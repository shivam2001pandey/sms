import 'package:flutter/material.dart';
import 'package:stock_management/screen2.dart';
import 'package:stock_management/screen3.dart';
import 'package:stock_management/screen3.dart';
import 'package:stock_management/view.dart';


class Screen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Screen1State();
  }
}

class Screen1State extends State<Screen1> {
   
 Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do You Really want to exit the App"),
              actions: <Widget>[
                FlatButton(
                  child: Text("No"),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
                FlatButton(
                  child: Text("Yes"),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                )
              ],
            ));
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Stock Management"),
            backgroundColor: Colors.indigo,
            //automaticallyImplyLeading: false,
          ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'SUSCOM',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text('suscomgroup.sits2018@gmail.com'),
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "S",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('ADD TO STOCK'),
                  onTap: () {
                      //Navigator.pop(context);
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen2()),
                    
                  );
                
                  },
                  trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 25.0,
                        ),
                ),
                ListTile(
                  title: Text('UPDATE STOCK'),
                  onTap: () {
                   //Navigator.pop(context);
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ItemList()),
                    
                  );
                  },
                  trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 25.0,
                        ),
                ),
                ListTile(
                  title: Text('VIEW STOCK'),
                  onTap: () {
                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewList()),);
                  },
                  trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 25.0,
                        ),
                ),
              ],
            ),
          ),
          body: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 120.0),
              child: Text(
                "SMS",
                textScaleFactor: 3.0,
              ),
            ),
            SizedBox(height: 50.0),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: () {
                         // Navigator.pop(context);
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen2()),
                    
                  );
                        },
                        child: new Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: 35.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "ADD",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: () {
                        //  Navigator.pop(context);
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ItemList()),
                    
                  );
                        },
                        child: new Icon(
                          Icons.update,
                          color: Colors.blue,
                          size: 35.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "UPDATE",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewList()),
                    
                  );
                          
                        },
                        child: new Icon(
                          Icons.view_list,
                          color: Colors.blue,
                          size: 35.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "VIEW",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}