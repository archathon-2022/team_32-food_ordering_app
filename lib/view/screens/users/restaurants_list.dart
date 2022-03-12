import 'package:archathon_team32/view/helpers/constants.dart';
import 'package:archathon_team32/view/screens/users/menus_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RestaurantsList extends StatefulWidget {
  RestaurantsList({required this.isFullMeal, required this.budget});
  bool isFullMeal;
  double budget;
  @override
  State<RestaurantsList> createState() => _RestaurantsListState();
}

class _RestaurantsListState extends State<RestaurantsList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text('Restaurants'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: StreamBuilder(
            stream: widget.isFullMeal ? FirebaseFirestore.instance.collection('restaurants').where('total', isLessThanOrEqualTo: widget.budget).snapshots(): FirebaseFirestore.instance.collection('restaurants').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasData && snapshot.data.docs.isEmpty == false){
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,

                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MenusList(documentId: snapshot.data.docs[index].id,))
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: width * 0.65,
                            height: height * 0.18,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.person),
                                      SizedBox(width: 20,),
                                      Text(
                                        snapshot.data.docs[index]['name'],
                                        style: TextStyle(
                                            fontSize: width * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.home_work_rounded),
                                      SizedBox(width: 20,),
                                      Text(
                                        snapshot.data.docs[index]['address'],
                                        style: TextStyle(
                                            fontSize: width * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.email),
                                      SizedBox(width: 20,),
                                      Text(
                                        snapshot.data.docs[index]['email'],
                                        style: TextStyle(
                                          fontSize: width * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if(widget.isFullMeal == true)...[
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Meal Total: ',
                                          style: TextStyle(
                                              fontSize: width * 0.05,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Text(
                                          snapshot.data.docs[index]['total'].toString(),
                                          style: TextStyle(
                                            fontSize: width * 0.05,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]
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
                    );
                  },
                );
              }else{
                return Center(
                  child: Container(
                    child: Text('Fetching ... !'),
                  ),
                );
              }
            },
          )
        ),
      ),
    );
  }
}
