import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderPending extends StatefulWidget {
  const OrderPending({Key? key}) : super(key: key);

  @override
  State<OrderPending> createState() => _OrderPendingState();
}

class _OrderPendingState extends State<OrderPending> {
  String restaurantId = '1GZHApYSikdQNfn7vFHa';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('orders').where("restaurantId", isEqualTo: restaurantId).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData && snapshot.data.docs.isEmpty == false){
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index){
                  return Container();
                }
            );
          }
          else{
            return Center(
              child: Container(
                child: Text('No pending orders!'),
              ),
            );
          }
        }
    );
  }
}
