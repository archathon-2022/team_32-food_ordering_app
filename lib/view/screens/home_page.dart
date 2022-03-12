import 'package:archathon_team32/view/helpers/constants.dart';
import 'package:archathon_team32/view/screens/restaurants/restaurant_dashboard.dart';
import 'package:archathon_team32/view/screens/users/user_dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  // late SharedPreferences pref;
  @override
  void initState() {
    super.initState();
    // initializePref();
    // pref = pref.then((SharedPreferences tempPref){
    //   return tempPref;
    // });
  }

  // void initializePref() async {
  //   pref = await SharedPreferences.getInstance();
  // }

  void setId(String role, String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(role, id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Continue as ...'),
          backgroundColor: themeColor,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextFormField(
                //   controller: controller,
                //   restorationId: 'signin_text_phone_number_field',
                //   textInputAction: TextInputAction.next,
                //   // focusNode: _phoneNumber,
                //   decoration: const InputDecoration(
                //     //filled: true,
                //     //icon: Icon(Icons.phone),
                //     helperText: 'Enter id',
                //     labelText: 'id',
                //     //prefixText: '+91 ',
                //   ),
                //   //keyboardType: TextInputType.phone,
                //   onSaved: (value) {
                //
                //   },
                // ),
                // SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: buttonColor),
                      onPressed: (){
                        setId("user", controller.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserDashboard())
                        );
                      },
                      child: Text(
                          'USER'
                      ),
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: buttonColor),
                      onPressed: (){
                        setId("restaurant", controller.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RestaurantDashboard())
                        );
                      },
                      child: Text(
                          'RESTAURANT'
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
