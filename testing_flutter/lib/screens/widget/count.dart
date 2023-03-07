import 'package:flutter/material.dart';
import 'package:testing_flutter/models/reviewcart_model.dart';
import 'package:testing_flutter/providers/reviewcart_provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Count extends StatefulWidget{

  late String heading;
  late String img;
  late String serviceID;
  late String price;
  //late int serviceQuantity;

  Count({required this.heading,
    required this.img,
    required this.serviceID,
    required this.price,});
@override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count>{
  int count=1;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(widget.serviceID)
        .get()
        .then(
          (value) => {
        if (this.mounted)
          {
            if (value.exists)
              {
                setState(() {
                  count = value.get("cartQuantity");
                  isTrue = value.get("isAdd");
                })
              }
          }
      },
    );
  }

  @override
  Widget build(BuildContext context){
    getAddAndQuantity();
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      padding: EdgeInsets.only(left: 5),
      height: 20,
      width: 60,
      //color: Colors.blue,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),

        borderRadius: BorderRadius.circular(8),
      ),
      child: isTrue==true
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              if (count> 1){
              setState(()
              {
              count--;
              });
              reviewCartProvider.updateReviewCartData(
                cartID: widget.serviceID,
                cartImage: widget.img,
                cartName: widget.heading,
                cartPrice: widget.price,
                cartQuantity: count,
              );
              if (count == 1){
                setState(()
                {
                  isTrue = false;
                });
                reviewCartProvider.reviewCartDataDelete(widget.serviceID);
              }
            }},
            child: Icon(
              Icons.remove,
            size: 10,
            color: Colors.black,
          ),
          ),
          Text("$count"),
            InkWell(
              onTap: (){
              setState(()
              {
                count ++;
              });
              reviewCartProvider.updateReviewCartData(
                cartID: widget.serviceID,
                cartImage: widget.img,
                cartName: widget.heading,
                cartPrice: widget.price,
                cartQuantity: count,
              );
            },
            child: Icon(Icons.add,
            size: 15,
            color: Colors.black,
          ),
          ),
        ],
      ):Center(
        child: InkWell(
          onTap: (){
            setState(()
            {
              isTrue = true;
            });
            reviewCartProvider.addReviewCartData(
                cartID: widget.serviceID,
                cartImage: widget.img,
                cartName: widget.heading,
                cartPrice: widget.price,
                cartQuantity: count, 
                 );
          },
          child: Text("ADD")
        ),
      ),
    );
  }
}