import 'package:flutter/material.dart';
import 'package:stock_management/update.dart';


class StockDetails extends StatefulWidget {
  String name,category,quantity,location,value;
  StockDetails( this.name, this.category, this.quantity, this.location,this.value);
  @override
  State<StatefulWidget> createState() {
    return StockDetailsState(this.name, this.category, this.quantity, this.location,this.value);
  }
}

class StockDetailsState extends State<StockDetails> {
String name,category,quantity,location,value;
  StockDetailsState(this.name, this.category, this.quantity, this.location,this.value);

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
                  padding: EdgeInsets.only(
                      top: 25.0, bottom: 25.0, left: 60.0, right: 60.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(border:Border.all(color:Colors.blue)),
                          child: OutlineButton
                          ( highlightedBorderColor: Colors.black,
                            padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'Update the Items',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blue),
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () async {
                              if(double.parse(quantity)<=15){
                                showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Text(
                                                      "Quantity of $name reached its Critical value"),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      child: Text("Got It"),
                                                      onPressed: () {
                                                                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Update(name,value,quantity);
                  }));
                                                      },
                                                    )
                                                  ],
                                                ));
                                      }
                              
                              else
                              
                             Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Update(name,value,quantity);
                  }));
                              
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                  
                                 ],
              ),
            ),
          ),
        ));
  }
}