import 'package:archathon_team32/view/helpers/constants.dart';
import 'package:archathon_team32/view/widgets/restaurants/restaurant_drawer.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        drawer: RestaurantDrawer(),
        appBar: AppBar(
          elevation: 20,
          shadowColor: Colors.grey,
          backgroundColor: themeColor,
          // backgroundColor: themeColor,
          title: Text('Your orders'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Pending',
              ),
              Tab(
                text: 'Completed',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Pending Orders')),
            Center(child: Text('Completed Orders')),
            // OrderPending(),
            // OrderCompleted(),
          ],
        ),
      ),
    );
  }
}