import 'package:app/%20HomePage.dart';
import 'package:app/Login.dart';
import 'package:app/Reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DBHelper.dart';
import 'Store.dart';

class tabbed extends StatelessWidget {
  String email;
  String name;
  tabbed() {
    set();
  }
  Future<List> set() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();

    List list = _preferences.getStringList(_preferences.getString("current"));
    list.add(_preferences.getString("current"));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Hotels",
                ),
                Tab(
                    icon: ImageIcon(AssetImage("assets/mobile.png")),
                    text: "Bookings"),
              ],
            ),
            title: Text("Dany Hotel Booking App"),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [HomePage(), Reservation()],
          ),
          drawer: Drawer(
              child: Container(
            child: FutureBuilder(
                future: set(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    print(snapshot.data);
                    return Column(children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        color: Theme.of(context).primaryColor,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 30, bottom: 10),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage("assets/man.png"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Text(
                                snapshot.data[1],
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                snapshot.data[2],
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Profile"),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Settings"),
                      ),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Logout"),
                        onTap: () async {
                          SharedPreferences _preferences =
                              await SharedPreferences.getInstance();
                          _preferences.setBool("login", false);
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Login()));
                        },
                      ),
                    ]);
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ))),
    ));
  }
}
