import "package:flutter/material.dart";

void main () {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Interest Calculator App",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent
      ),
      home: SIForm(),
    )
  );
}

class SIForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _currencies = ['Rupees' , 'Dollars', 'Pounds'];
  final _minimumPadding = 5.0;
  @override
  Widget build(BuildContext context) {

    TextStyle textstyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:Text('Simple Interest Calculator'),
      ),
      body:
        Container(
        margin: EdgeInsets.all(_minimumPadding),
        child : ListView(
        children:<Widget>[
            getImageAsset(),
         Padding(

           padding: EdgeInsets.only(top: _minimumPadding , bottom: _minimumPadding),
             child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Principal',
              hintText: 'Enter Principal e.g. 12000',
              labelStyle: textstyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
          ),
         ),
          Padding(
            padding: EdgeInsets.only(top: _minimumPadding , bottom: _minimumPadding),
            child:
          TextField(
            style : textstyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Rate of Interest',
              hintText: 'In percent',
              labelStyle: textstyle,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
              )
          ),
        ),
          ),

        Row(
          children: <Widget>[
        Expanded(

        child:
        TextField(
          style : textstyle,
        keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Term',
              hintText: 'Time in Years',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
              )
          ),
        ),

        ),

      Container(width: _minimumPadding*5),
      Expanded(
        child:DropdownButton<String>(
          items: _currencies.map((String value){
            return DropdownMenuItem<String>(
              value: value,
              child : Text(value),
            );
          }).toList(),

          value: 'Rupees',
          onChanged: (String newValueSelected){

          },
        )
      )

    ]
       ),
      Padding(
        padding: EdgeInsets.only(bottom: _minimumPadding , top: _minimumPadding),
        child:Row(children: <Widget>[
        Expanded(

          child: RaisedButton(
              color: Theme.of(context).accentColor,
              textColor: Theme.of(context).primaryColorDark,
            child: Text('Reset',textScaleFactor: 1.5),
            onPressed: (){

            }
          )
        ),
          Expanded(
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                  textColor: Theme.of(context).primaryColorDark,
                  child: Text('Calculate', textScaleFactor: 1.5,),
                  onPressed: (){

                  }
              )
          ),


      ],
        ),

      ),
          Padding(
            padding: EdgeInsets.all(_minimumPadding*2),
            child: Text('Todo Text'),
          )


    ]
          ),
        ),
        );
  }

  Widget getImageAsset()
  {
    AssetImage assetImage= AssetImage('images/kirishima_touka_by_miura_n315_dd4rdg7.jpg');
    Image image = Image(image : assetImage , width: 125.0 , height: 125.0);

    return Container(child: image , margin:EdgeInsets.all(50.0));
  }

}