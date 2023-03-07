  import 'package:flutter/material.dart';
import 'package:testing_flutter/providers/reviewcart_provider.dart';
import 'package:testing_flutter/screens/checkout/payment_summary.dart';
  import 'package:testing_flutter/screens/home_screen/drawer_side.dart';
  import 'package:provider/provider.dart';
import '../../models/reviewcart_model.dart';
import '../widget/single_item.dart';
  import 'package:testing_flutter/screens/checkout/delivery_details/delivery_details.dart';

  class ReviewCart extends StatelessWidget{
    late ReviewCartProvider reviewCartProvider;
    showAlertDialog(BuildContext context,ReviewCartModel delete) {

      // set up the buttons
      Widget cancelButton = TextButton(
        child: Text("No"),
        onPressed:  () {
          Navigator.of(context).pop();
        },
      );
      Widget continueButton = TextButton(
        child: Text("Yes"),
        onPressed:  () {
          reviewCartProvider.reviewCartDataDelete(delete.cartID);
          Navigator.of(context).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Cart Service"),
        content: Text("Do you want to Delete this Service from cart"),
        actions: [
          cancelButton,
          continueButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    @override
    Widget build(BuildContext context) {
      reviewCartProvider = Provider.of(context);
      reviewCartProvider.getReviewCartData();
      return Scaffold(
        bottomNavigationBar: ListTile(
          title: Text("Total Amount"),
          subtitle: Text("\Rs. 800", style: TextStyle(
              color: Colors.deepPurple),) ,
          trailing: Container(
            width: 160,
            child: MaterialButton(
              child: Text("Submit"),
              color: Colors.amber,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(
                  30),),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder:(context) => DeliveryDetails(),
                ));
              },),
        ),
        ),
        appBar: AppBar(
          title: Text("Review cart",style: TextStyle(color: Colors.white, fontSize: 18),)
        ),
        body:reviewCartProvider.getReviewCartDataList.isEmpty?Center(
          child: Text("NO DATA"),
        ): ListView.builder(
          itemCount: reviewCartProvider.getReviewCartDataList.length,
          itemBuilder: (context,index){
            ReviewCartModel data= reviewCartProvider.getReviewCartDataList[index];
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),

                SingleItem( isBool:true,
                    heading: data.cartName,
                    img:data.cartImage,
                    serviceID: data.cartID,
                    serviceQuantity: data.cartQuantity,
                    price: data.cartPrice,
                  onDelete: (){
                    showAlertDialog(context,data);
                  },

                ),
              ],
            );
          },
        ),
      );
    }
  }