import 'package:bus_booking/features/bus_booking/presentation/pages/booking/BookingPage.dart';
import 'package:bus_booking/features/bus_booking/presentation/pages/calendar/CalendarPage.dart';
import 'package:bus_booking/features/bus_booking/presentation/pages/map/MapPage.dart';
import 'package:bus_booking/features/bus_booking/presentation/pages/schedules/SchedulesPage.dart';
import 'package:bus_booking/features/bus_booking/presentation/services/auth.dart';
import 'package:bus_booking/features/bus_booking/presentation/widgets/drawer/DrawerItem.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  final drawerItems = [
    new DrawerItem("Schedules", Icons.schedule),
    new DrawerItem("Map", Icons.map),
    new DrawerItem("Calendar", Icons.calendar_view_day),  
    new DrawerItem("Booking", Icons.book)
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  int _selectedDrawerIndex = 0;
  

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new SchedulesPage(); 
      case 1:
        return new MapPage();
      case 2:
        return new CalendarPage();
      case 3:
        return new BookingPage();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            textColor: Colors.white,
            label: Text('LOGOUT'),
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              _auth.signout();
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("John Doe"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
