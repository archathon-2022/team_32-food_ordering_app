import 'package:archathon_team32/view/helpers/constants.dart';
import 'package:archathon_team32/view/screens/users/user_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenusList extends StatefulWidget {
  MenusList({required this.documentId});
  String documentId;

  @override
  State<MenusList> createState() => _MenusListState();
}

class _MenusListState extends State<MenusList> {

  void placeOrder(name, cuisine, description, price) async {
    dynamic orderMap = {
      'name' : 'Rahul Shah',
      'contact': '9876543210',
      'address': 'address1',
      'itemName': name,
      'cuisine': cuisine,
      'description': description,
      'price': price,
      'restaurantId': widget.documentId
    };

    FirebaseFirestore.instance.collection('orders').add(orderMap).then((value){
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Date inserted successfully'),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                ),
                onPressed: (){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => UserDashboard()), (route) => false);
                },
                child: Text('OK'),
              ),
            ],
          );
        }
      );
    }).catchError((error) => {
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text('An error occured. Please try again later'),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          }
      )
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text('Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('restaurants').doc(widget.documentId).collection('menu').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.hasData && snapshot.data.docs.isEmpty == false){
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: width * 0.65,
                            height: height * 0.2,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Name: ',
                                            style: TextStyle(
                                              fontSize: width * 0.05,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(width: 10,),
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
                                          Text(
                                            'Cuisine: ',
                                            style: TextStyle(
                                              fontSize: width * 0.05,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            snapshot.data.docs[index]['cuisine'],
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
                                          Text(
                                            'Description: ',
                                            style: TextStyle(
                                              fontSize: width * 0.05,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            snapshot.data.docs[index]['description'],
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
                                          Text(
                                            'Price: ',
                                            style: TextStyle(
                                              fontSize: width * 0.05,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            snapshot.data.docs[index]['price'],
                                            style: TextStyle(
                                              fontSize: width * 0.05,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: height * 0.07,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(primary: Colors.green, elevation: 10),
                                      onPressed: (){
                                        placeOrder(snapshot.data.docs[index]['name'], snapshot.data.docs[index]['cuisine'], snapshot.data.docs[index]['description'], snapshot.data.docs[index]['price']);
                                      },
                                      child: Text(
                                          'Place order'
                                      ),
                                    ),
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
