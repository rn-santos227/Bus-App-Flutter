import 'package:bus_booking/features/bus_booking/presentation/services/auth.dart';
import 'package:bus_booking/features/bus_booking/presentation/widgets/buttons/LocalFlatButton.dart';
//import 'package:bus_booking/features/bus_booking/presentation/widgets/buttons/LocalPictureButton.dart';
import 'package:bus_booking/features/bus_booking/presentation/widgets/buttons/LocalRaisedButton.dart';
import 'package:bus_booking/features/bus_booking/presentation/widgets/loaders/Loading.dart';
import 'package:bus_booking/features/bus_booking/presentation/widgets/textfields/TextDecorations.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email, password;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Bus Booking Login"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Center( 
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) => val.isEmpty ? 'Please enter Email Address.' : null,
                      decoration: new TextDecoration(
                        iconData: Icons.email,
                        hint: 'Email Address',
                      ),
                      onChanged: (text) {
                        setState(() {
                          email = text.trim();
                        });
                      },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      obscureText: true,
                      validator: (val) => val.isEmpty ? 'Please enter Password.' : null,
                      decoration: new TextDecoration(
                        iconData: Icons.lock,
                        hint: 'Password'
                      ),                 
                      onChanged: (text) {
                        setState(() {
                          password = text.trim();
                        });                       
                      },
                  ),

                  LocalRaisedButton(
                    text: "LOGIN WITH ACCOUNT",
                    icon: Icons.check_circle_outline,
                    function: () async {
                      if(_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.loginEmail(email, password);
                        if(result == null) {
                          setState(() {
                            loading = false;
                          });
                          return;
                        }                        
                      }
                    }
                  ),

                  // LocalPictureButton(
                  //   text: "LOGIN WITH GOOGLE",
                  //   picture: "assets/images/icons/google.png",
                  //   function: () async {
                  //     if(_formKey.currentState.validate()) {
                  //       dynamic result = await _auth.loginEmail(email, password);
                  //       if(result == null) {

                  //       }                        
                  //     }
                  //   }
                  // ),

                  LocalFlatButton(
                    text: "JOIN", 
                    icon: Icons.person_add,
                    function: () async {
                      Navigator.pushNamed(context, '/join');
                  }),
              ],),
            ),
          ),
        ),
      ),
    );
  }
}