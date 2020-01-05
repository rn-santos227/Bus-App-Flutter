import 'package:bus_booking/features/bus_booking/presentation/services/auth.dart';
import 'package:bus_booking/features/bus_booking/presentation/widgets/buttons/LocalRaisedButton.dart';
import 'package:bus_booking/features/bus_booking/presentation/widgets/loaders/Loading.dart';
import 'package:bus_booking/features/bus_booking/presentation/widgets/textfields/TextDecorations.dart';
import 'package:flutter/material.dart';

class JoinPage extends StatefulWidget {
  JoinPage({Key key}) : super(key: key);

  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email, name, address, contact, password;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Bus Booking Registration"),
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
                      keyboardType: TextInputType.text,
                      validator: (val) => val.isEmpty ? 'Please enter your Name.' : null,
                      decoration: new TextDecoration(
                        iconData: Icons.person,
                        hint: 'Name'
                      ), 
                      onChanged: (text) {
                        setState(() {
                          name = text.trim();
                        });
                      },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (val) => val.isEmpty ? 'Please enter your Address.' : null,
                    decoration: new TextDecoration(
                      iconData: Icons.home,
                      hint: 'Home Address'
                    ), 
                    onChanged: (text) {
                        setState(() {
                          address = text.trim();;
                        });
                      },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),                  
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (val) => val.isEmpty ? 'Please enter your Contact Number.' : null,
                    decoration: new TextDecoration(
                      iconData: Icons.phone,
                      hint: 'Contact Number'
                    ), 
                    onChanged: (text) {
                        setState(() {
                          contact = text.trim();
                        });
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => val.isEmpty ? 'Please enter your Email Address.' : null,
                    decoration: new TextDecoration(
                      iconData: Icons.email,
                      hint: 'Email Address'
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
                      validator: (val) => val.length < 6 ? "Password should be 6+ characters long." : null,
                      decoration: new TextDecoration(
                        iconData: Icons.lock,
                        hint: "Password"
                      ),                   
                      onChanged: (text) {
                        setState(() {
                          password = text.trim();
                        });                        
                      },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      obscureText: true,
                      validator: (val) => val != password ? "Password does not matched." : null,
                      decoration: new TextDecoration(
                        iconData: Icons.lock,
                        hint: "Confirm Password"
                      ),                   
                      onChanged: (text) {
                        setState(() {
                          password = text.trim();
                        });                        
                      },
                  ),

                  LocalRaisedButton(
                    text: "JOIN", 
                    icon: Icons.person_add,
                    function: () async {
                      if(_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.createAccount(email, password, name, address, contact);
                        if(result == null) {
                          setState(() {
                            loading = false;
                          });
                          return;
                        }
                        Navigator.pop(context);
                      }
                  }),
              ],),
            ),
          ),
        ),
      )
    );
  }
}