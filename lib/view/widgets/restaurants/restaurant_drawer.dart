import 'package:archathon_team32/view/screens/restaurants/orders.dart';
import 'package:archathon_team32/view/screens/users/restaurants_list.dart';
import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../../screens/home_page.dart';
import '../../splash.dart';

class RestaurantDrawer extends StatefulWidget {
  const RestaurantDrawer({Key? key}) : super(key: key);

  @override
  State<RestaurantDrawer> createState() => _RestaurantDrawerState();
}

class _RestaurantDrawerState extends State<RestaurantDrawer> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: height * 0.07,),
          Text('Restaurant app', style: TextStyle(fontSize: 20)),
          SizedBox(height: height * 0.03,),
          Container(color: Colors.grey, height: 2,),
          SizedBox(height: height * 0.04,),
          Material(
            elevation: 2.0,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              width: width * 0.65,
              height: height * 0.07,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 20,),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                //color: themeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      end: Alignment.bottomRight,
                      // Add one stop for each color
                      // Values should increase from 0.0 to 1.0
                      stops: [0.2, 1],
                      colors: [Colors.white, Colors.green.withOpacity(0.5)]
                  )
              ),
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Orders())
              );
            },
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: width * 0.65,
                height: height * 0.07,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.data_array),
                      SizedBox(width: 20,),
                      Text(
                        'Orders List',
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  //color: themeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      // begin: Alignment.center,
                        end: Alignment.bottomRight,
                        // Add one stop for each color
                        // Values should increase from 0.0 to 1.0
                        stops: [0.2, 1],
                        colors: [Colors.white, Colors.green.withOpacity(0.5)]
                    )
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){

            },
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: width * 0.65,
                height: height * 0.07,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.group),
                      SizedBox(width: 20,),
                      Text(
                        'Customers List',
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  //color: themeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      // begin: Alignment.center,
                        end: Alignment.bottomRight,
                        // Add one stop for each color
                        // Values should increase from 0.0 to 1.0
                        stops: [0.2, 1],
                        colors: [Colors.white, Colors.green.withOpacity(0.5)]
                    )
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.47,),
          GestureDetector(
            onTap: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
            },
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: width * 0.65,
                height: height * 0.07,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 20,),
                      Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  //color: themeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
