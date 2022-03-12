import 'package:archathon_team32/view/helpers/constants.dart';
import 'package:archathon_team32/view/screens/users/restaurants_list.dart';
import 'package:flutter/material.dart';

class FullMeal extends StatefulWidget {
  const FullMeal({Key? key}) : super(key: key);

  @override
  State<FullMeal> createState() => _FullMealState();
}

class _FullMealState extends State<FullMeal> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text('Full Meal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
              restorationId: 'signin_text_phone_number_field',
              textInputAction: TextInputAction.next,
              // focusNode: _phoneNumber,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                //filled: true,
                //icon: Icon(Icons.phone),
                helperText: 'Enter your budget',
                labelText: 'Your Budget',
                //prefixText: '+91 ',
              ),
              //keyboardType: TextInputType.phone,
              onSaved: (value) {

              },
            ),
            SizedBox(height: 30,),
            Container(
              height: height * 0.06,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green, elevation: 10),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RestaurantsList(isFullMeal: true, budget: double.parse(controller.text),))
                  );
                },
                child: Text(
                    'Fetch Restaurants'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
