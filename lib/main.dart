import 'package:bus_booking/features/bus_booking/presentation/pages/authenticate/JoinPage.dart';
import 'package:bus_booking/features/bus_booking/presentation/pages/home/HomePage.dart';
import 'package:bus_booking/features/bus_booking/presentation/services/auth.dart';
import 'package:bus_booking/features/bus_booking/presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/bus_booking/data/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value( 
      value: AuthService().user,
      child: MaterialApp(
        title: 'Bus Booking App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.blue[50],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blue,     
            textTheme: ButtonTextTheme.primary, 
          )
        ),
        home: Wrapper(),
        routes: <String, WidgetBuilder>{
          '/join': (BuildContext context) => new JoinPage(),
        },
      )
    );
  }
}
