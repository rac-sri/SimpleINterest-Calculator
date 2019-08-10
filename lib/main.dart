import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator App",
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent),
    home: SIForm(),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {

  var _formKey = GlobalKey<FormState>();
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  final _minimumPadding = 5.0;
  var _curretItemSelected = "Rupees";

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  var displayText = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textstyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Form(
        key : _formKey,
        // margin: EdgeInsets.all(_minimumPadding),
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding * 2),
          child: ListView(children: <Widget>[
            getImageAsset(),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                controller: principalController,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Please enter principal amount';
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Principal',
                    hintText: 'Enter Principal e.g. 12000',
                    errorStyle: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize : 15.0
                    ),
                    labelStyle: textstyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                controller: roiController,
                style: textstyle,
                validator: (String value){
                  if(value.isEmpty)
                    return 'Please enter tare of interest';
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Rate of Interest',
                    hintText: 'In percent',
                    labelStyle: textstyle,
                    errorStyle: TextStyle(
                      color :Colors.yellowAccent,
                      fontSize: 15.0
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: termController,
                  style: textstyle,
                  validator: (String value){
                    if(value.isEmpty)
                      {
                        return 'Please enter time';
                      }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Term',
                      hintText: 'Time in Years',
                      labelStyle: textstyle,
                      errorStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Container(width: _minimumPadding * 5),
              Expanded(
                  child: DropdownButton<String>(
                items: _currencies.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _curretItemSelected,
                onChanged: (String newValueSelected) {
                  _onDropItemSelected(newValueSelected);
                },
              ))
            ]),
            Padding(
              padding: EdgeInsets.only(
                  bottom: _minimumPadding, top: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          textColor: Theme.of(context).primaryColorDark,
                          child: Text('Reset', textScaleFactor: 1.5),
                          onPressed: () {
                            setState(() {
                              _reset();
                            });
                          })),
                  Expanded(
                      child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text(
                      'Calculate',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {

                      setState(() {
                        if(_formKey.currentState.validate()){
                           this.displayText = _calculateTotalReturns();}
                      });
                    },
                  )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text(this.displayText),
            )
          ]),
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage =
        AssetImage('images/kirishima_touka_by_miura_n315_dd4rdg7.jpg');
    Image image = Image(image: assetImage, width: 125.0, height: 125.0);

    return Container(child: image, margin: EdgeInsets.all(50.0));
  }

  void _onDropItemSelected(String newValueSelected) {
    setState(() {
      this._curretItemSelected = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        'After $term years , your investment will be worth ${totalAmountPayable}';
    print(result);
    return result;
  }

  void _reset() {
    principalController.text = "";
    roiController.text = "";
    termController.text = "";
    displayText = "";
    _curretItemSelected = _currencies[0];
  }
}
