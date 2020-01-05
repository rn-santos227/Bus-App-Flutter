import 'package:bus_booking/features/bus_booking/data/models/user.dart';
import 'package:bus_booking/features/bus_booking/presentation/pages/authenticate/LoginPage.dart';
import 'package:bus_booking/features/bus_booking/presentation/pages/home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if(user == null) {
      return LoginPage();
    } else {
      return HomePage(title: 'Bus Booking App');
    }
  }
}