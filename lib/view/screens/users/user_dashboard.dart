import 'package:archathon_team32/view/helpers/constants.dart';
import 'package:archathon_team32/view/widgets/users/menus_slider.dart';
import 'package:archathon_team32/view/widgets/users/restaurants_slider.dart';
import 'package:archathon_team32/view/widgets/users/user_drawer.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text('Dashboard'),
      ),
      drawer: UserDrawer(),
      body: Container(
        //color: Color(0xfffff0f5),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.07,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Top Pick Restaurants',
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
                            stops: [0.1, 1],
                            colors: [Colors.white, Colors.orange.withOpacity(0.5)]
                        )

                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(height: height * 0.2,child: RestaurantsSlider()),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.07,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You may want ..',
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
                            stops: [0.1, 1],
                            colors: [Colors.white, Colors.orange.withOpacity(0.5)]
                        )

                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(height: height * 0.2,child: MenusSlider()),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Center(
              //     child: Material(
              //       color: Colors.white,
              //       elevation: 4.0,
              //       borderRadius: BorderRadius.circular(10),
              //       child: Padding(
              //         padding: const EdgeInsets.all(15.0),
              //         child: Container(
              //           height: height * 0.5,
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //
              //
              //             ],
              //           ),
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
