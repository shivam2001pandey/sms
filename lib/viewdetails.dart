import 'package:flutter/material.dart';

class ViewDetails extends StatefulWidget {
  String name,category,quantity,location,value,totvalue;
  ViewDetails( this.name, this.category, this.quantity, this.location,this.value,this.totvalue);
  @override
  State<StatefulWidget> createState() {
    return ViewDetailsState(this.name, this.category, this.quantity, this.location,this.value,this.totvalue);
  }
}

class ViewDetailsState extends State<ViewDetails> {
String name,category,quantity,location,value,totvalue;
  ViewDetailsState(this.name, this.category, this.quantity, this.location,this.value,this.totvalue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
                top: 70.0, left: 15.0, right: 20.0, bottom: 100.0),
            child: Card(
              elevation: 15.0,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(top: 25.0, left: 85.0, right: 10.0),
                    child: Row(children: <Widget>[
                      Text("Stock Details",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22.0)),
                    ]),
                  ),
                  /*Padding(
                    padding: EdgeInsets.only(top: 45.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text("Reference Number :  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Text("$ref",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.0)),
                    ]),
                  ),*/
                    Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text("Name of Item:  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Expanded(
                          child: Text("$name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0))),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text("Location :  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Expanded(
                          child: Text("$location",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0))),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text("Category :  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Text("$category",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.0)),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text("Quantity :  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Text("$quantity",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.0)),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text("Value :  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Text("$value",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.0)),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text("Total Value :  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Text("$totvalue",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.0)),
                    ]),
                  ),
                  
                                 ],
              ),
            ),
          ),
        ));
  }
}