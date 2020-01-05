import 'package:flutter/material.dart';


class LocalPictureButton extends StatelessWidget {
  final String text;
  final String picture;
  final Function function;

  const LocalPictureButton({
    Key key,
    @required this.text,
    @required this.picture,
    @required this.function
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: EdgeInsets.only(top: 15),
      child: SizedBox(
          height: 50.0,
          width: double.infinity,   
          child: FlatButton(       
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.blue, width: 3.0),
            ),
            textTheme: ButtonTextTheme.primary,
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      picture,
                      width: 28.0,
                      height: 28.0,
                    ),
                ),
                Align(
                    alignment: Alignment.center,
                    child:  Text(    
                    this.text,
                    style: new TextStyle(
                      fontSize: 18.0,
                    ),  
                  ), 
                ),
              ],
            ), 
            onPressed: function
          ),
        )
      );
  }
}