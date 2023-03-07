import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/reviewcart_model.dart';

class ReviewCartProvider with ChangeNotifier{

  void addReviewCartData({
    required String cartID,
    required String cartImage,
    required String cartName,
    required String cartPrice,
    required int cartQuantity,
    //required bool isAdd,
  })async{
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartID).set(
        {
          "cartID":cartID,
          "cartName":cartName,
          "cartImage":cartImage,
          "cartPrice":cartPrice,
          "cartQuantity":cartQuantity,
          "isAdd":true,
        },);
  }

  void updateReviewCartData({
    required String cartID,
    required String cartImage,
    required String cartName,
    required String cartPrice,
    required int cartQuantity,
    //required bool isAdd,
  })async{
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartID).update(
      {
        "cartID":cartID,
        "cartName":cartName,
        "cartImage":cartImage,
        "cartPrice":cartPrice,
        "cartQuantity":cartQuantity,
        "isAdd":true,
      },);
  }
  List<ReviewCartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];

    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .get();
    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartID: element.get("cartID"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
        //cartUnit: element.get("cartUnit"),
      );
      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }
  ////total price////

  // getTotalPrice(){
  //   String total;
  //   reviewCartDataList.forEach((element) {
  //     total = "800;
  //
  //   });
  //   return total;
  // }



////////reviewCartDelete/////
  reviewCartDataDelete(cartID) {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartID)
        .delete();
    notifyListeners();
  }
}

