import 'package:archathon_team32/view/helpers/constants.dart';
import 'package:archathon_team32/view/screens/users/menus_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MenusSlider extends StatefulWidget {
  const MenusSlider({Key? key}) : super(key: key);

  @override
  State<MenusSlider> createState() => _MenusSliderState();
}

class _MenusSliderState extends State<MenusSlider> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('orders').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData && snapshot.data.docs.isEmpty == false){
          return ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenusList(documentId: snapshot.data.docs[index].id,))
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: width * 0.65,
                      height: height * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  snapshot.data.docs[index]['itemName'],
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
    );
  }
}
