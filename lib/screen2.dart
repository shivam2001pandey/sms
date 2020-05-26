
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


TextEditingController nameController = TextEditingController();

TextEditingController locationController = TextEditingController();
TextEditingController valueController = TextEditingController();
TextEditingController quantityController = TextEditingController();
final db = Firestore.instance;

class Screen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Screen2State();
  }
}

class Screen2State extends State<Screen2> {
  var _formkeys = GlobalKey<FormState>();

GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();
String _currentSelectedValue;
 
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Items"),
          automaticallyImplyLeading: false,
          /*actions: <Widget>[
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
          ],*/
        ),
        key:scaffoldState,
        body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: Form(
              key: _formkeys,
              child: ListView(children: <Widget>[
                TextFormField(
                  controller: nameController,
                  validator: (value) {
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
               Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextFormField(
                    controller: locationController,
                    validator: (String value) {
                      if (value.isEmpty)
                        return 'Please Enter the Location';
                    },
                    onChanged: (value) {
                      debugPrint('Something changed in Date Text Field');
                    },
                    
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.event_note,
                          color: Colors.grey[900],
                        ),
                        labelText: 'Location',
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
              
                  value:_currentSelectedValue,
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (String newValue) {
                  setState(() {
                        _currentSelectedValue= newValue;
                  });},
                  hint: Text("Description"),
                  items: <String>[' Cables', ' Connectors', ' Cable Assembly']
                       .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value:value,
                            child: Padding(
                            padding: EdgeInsets.only(left: 4),
                            child:Text(value),
                           ),);
                 }).toList(),
      ),),),
                   Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextFormField(
                    controller: valueController,
                    validator: (String value) {
                      if (value.isEmpty)
                        return 'Please Enter the Value';
                      else if(double.parse(value)<=0)
                        return 'Value should not be negative';
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
                        labelText: 'Value',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextFormField(
                    controller: quantityController,
                    validator: (String value) {
                      if (value.isEmpty)
                        return 'Please Enter the Quantity';
                      else if(double.parse(value)<=0)
                        return 'Quantity should not be negative';
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
                              'Add the Items',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blue),
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () async {
                              var x=nameController.text.substring(0,1).toUpperCase();
                              if (_formkeys.currentState.validate()) {
                                double totPrice=(double.parse(quantityController.text))*(double.parse(valueController.text));

                                
                                await db
                                    .collection('MasterData')
                                    .document((nameController.text+_currentSelectedValue).toUpperCase())
                                    .setData(
                                  {
                                    'Name': (nameController.text+_currentSelectedValue).toUpperCase(),
                                    'Category':_currentSelectedValue,
                                    'value': valueController.text,
                                    'Quantity':quantityController.text,
                                    'Total Value':totPrice.toString(),
                                     'Location':locationController.text,
                                     'SearchKey':x 
                                  },
                                );
                                final snackBar = SnackBar(content: Text('Item Successfully Listed In Stock!',textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold)));
                scaffoldState.currentState.showSnackBar(snackBar);
                              }
                           
                              nameController.clear();
                              valueController.clear();
                              quantityController.clear();
                              locationController.clear();
                              
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