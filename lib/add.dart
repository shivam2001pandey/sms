import 'dart:async';

import 'package:flutter/material.dart';


TextEditingController itemController = TextEditingController();

TextEditingController pieceController = TextEditingController();
//TextEditingController addController = TextEditingController();


class add extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return addState();
  }
}

class addState extends State<add> {
  var _formkeys = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffold_state = new GlobalKey<ScaffoldState>();
  static var count, countNew, fields;
  String dropdownValue;
  DateTime _currentdate = new DateTime.now();

  //Same
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text("Add To Stock"),
          automaticallyImplyLeading: false,
          actions: <Widget>[
           
          ],
        ),
        key: scaffold_state,
        body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: Form(
              key: _formkeys,
              child: ListView(children: <Widget>[
                TextFormField(
                  controller: itemController,
                  validator: (String value) {
                    if (value.isEmpty)
                      return 'Please Enter the Item\'s Name';
                  },
                  onChanged: (value) {
                    debugPrint('Something changed in Item Text Field');
                  },
                  decoration: InputDecoration(
                      labelText: 'Item Name',
                      prefixIcon: Icon(
                        Icons.shopping_cart,
                        color: Colors.grey[900],
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),

                //Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextFormField(
                    controller: pieceController,
                    validator: (String value) {
                      if (value.isEmpty)
                        return 'Please Enter the Quantity';
                    },
                    onChanged: (value) {
                      debugPrint('Something changed in Date Text Field');
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.event_note,
                          color: Colors.grey[900],
                        ),
                        labelText: 'Quantity',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

        DropdownButtonHideUnderline(
        child: Container(
          
          decoration:BoxDecoration(border: Border.all(color: Colors.blueAccent)
          ),
          width: 300,
          //margin: EdgeInsets.only(left: 10.0, right: 10.0),
          /*decoration: ShapeDecoration(
            color: Colors.white,
           
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
          ),*/
          child: DropdownButton<String>(
            iconEnabledColor: Colors.blueAccent,
              
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (String newValue) {
                  setState(() {
                        dropdownValue = newValue;
                  });},
                  hint: Text("description"),
                  items: <String>['Cables', 'Connectors', 'Cable Assembly']
                       .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                            padding: EdgeInsets.only(left: 4),
                            child:Text(value),
                           ),);
                 }).toList(),
      ),),),

               

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
                           // color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            
                            child: Text(
                              'Add Item',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blue),
                              textScaleFactor: 1.5,
                            ),
                            onPressed: ()  {
                             
                              final snackBar = SnackBar(content: Text('Item Successfully Listed In Stock!',textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold)));
                scaffold_state.currentState.showSnackBar(snackBar);
                             
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )));
  }
}