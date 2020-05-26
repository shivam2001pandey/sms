import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stock_management/screen3.dart';

TextEditingController numberController = TextEditingController();

final db = Firestore.instance;

class Update extends StatefulWidget {
  String name, value, quantity;
  Update(this.name, this.value, this.quantity);
  @override
  State<StatefulWidget> createState() {
    return UpdateState(this.name, this.value, this.quantity);
  }
}

class UpdateState extends State<Update> {
  var _formkeys = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

  var _currentSelectedValue;
  String name, value, quantity;
  UpdateState(this.name, this.value, this.quantity);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update Items"),
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
        key: scaffoldState,
        body: Padding(
          
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: Form(
              key: _formkeys,
              child: ListView(children: <Widget>[
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    width: 300,
                    //margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    /*decoration: ShapeDecoration(
            color: Colors.white,
           
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
          ),*/
                    child: DropdownButton<String>(
                      iconEnabledColor: Colors.blueAccent,
                      value: _currentSelectedValue,
                      icon: Icon(Icons.arrow_drop_down),
                      onChanged: (String newValue) {
                        setState(() {
                          _currentSelectedValue = newValue;
                        });
                      },
                      hint: Text("Incoming/Issue"),
                      items: <String>['Incoming', 'Issue']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: numberController,
                    validator: (String value) {
                      if (value.isEmpty)
                        return 'Please Enter the Number';
                      else if (double.parse(value) <= 0)
                        return 'Quantity should not be negative';
                    },
                    onChanged: (value) {
                      debugPrint('Something changed in Date Text Field');
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.event_note,
                          color: Colors.grey[900],
                        ),
                        labelText: 'Number of Items',
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
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue)),
                          child: OutlineButton(
                            highlightedBorderColor: Colors.black,
                            padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'Update',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () async {
                              if (_formkeys.currentState.validate()) {
                                if (_currentSelectedValue == 'Incoming') {
                                  double qty;
                                  qty = (double.parse(numberController.text)) +
                                      (double.parse(quantity));
                                  double totPrice = qty * (double.parse(value));

                                  await db
                                      .collection('MasterData')
                                      .document(name)
                                      .updateData(
                                    {
                                      'Quantity': qty.toString(),
                                      'Total Value': totPrice.toString(),
                                    },
                                  );

                                  final snackBar = SnackBar(
                                      content: Text(
                                          'Item Successfully Updated In Stock!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)));
                                  scaffoldState.currentState
                                      .showSnackBar(snackBar);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ItemList();
                                  }));
                                } else {
                                   
                                  if (double.parse(quantity) >=
                                      double.parse(numberController.text)) {
                                    {
                                      double qty;
                                      qty = (double.parse(quantity)) -
                                          (double.parse(numberController.text));
                                      double totPrice =
                                          qty * (double.parse(value));

                                     
                                      await db
                                          .collection('MasterData')
                                          .document(name)
                                          .updateData(
                                        {
                                          'Quantity': qty.toString(),
                                          'Total Value': totPrice.toString(),
                                        },
                                      );
                                    }
                                    final snackBar = SnackBar(
                                        content: Text(
                                            'Item Successfully Updated In Stock!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)));
                                    scaffoldState.currentState
                                        .showSnackBar(snackBar);

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ItemList();
                                    }));
                                  } else {
                                    final snackBar = SnackBar(
                                        content: Text('Item Not In Stock!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)));
                                    scaffoldState.currentState
                                        .showSnackBar(snackBar);
                                  }
                                }
                              }
                              numberController.clear();
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
