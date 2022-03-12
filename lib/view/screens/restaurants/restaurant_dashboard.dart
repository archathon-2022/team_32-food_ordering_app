import 'package:archathon_team32/view/helpers/constants.dart';
import 'package:archathon_team32/view/widgets/restaurants/restaurant_drawer.dart';
import 'package:archathon_team32/view/widgets/users/user_drawer.dart';
import 'package:flutter/material.dart';

class RestaurantDashboard extends StatefulWidget {
  const RestaurantDashboard({Key? key}) : super(key: key);

  @override
  State<RestaurantDashboard> createState() => _RestaurantDashboardState();
}

class _RestaurantDashboardState extends State<RestaurantDashboard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text('Dashboard'),
      ),
      drawer: RestaurantDrawer(),
      body: Container(
        //color: Color(0xfffff0f5),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Center(
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: width * 0.6,
                    height: height * 0.07,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Statistics',
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
              SizedBox(
                height: height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Material(
                    color: Colors.white,
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: height * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Pending Orders: ',
                                  style: TextStyle(
                                    fontSize: width * 0.05,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  'NULL',
                                  style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Completed Orders: ', style: TextStyle(
                                  fontSize: width * 0.05,
                                ),),
                                SizedBox(width: 10,),
                                Text(
                                  'NULL',
                                  style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Total Customers: ', style: TextStyle(
                                  fontSize: width * 0.05,
                                ),),
                                SizedBox(width: 10,),
                                Text(
                                  'NULL',
                                  style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Your Customers: ', style: TextStyle(
                                  fontSize: width * 0.05,
                                ),),
                                SizedBox(width: 10,),
                                Text(
                                  'NULL',
                                  style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
