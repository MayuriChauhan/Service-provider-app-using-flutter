import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_flutter/models/delivery_address_model.dart';
import 'package:testing_flutter/screens/checkout/delivery_details/single_delivery_item.dart';

import '../../../providers/reviewcart_provider.dart';
//import '../delivery_details/single_delivery_item.dart';
import 'order_item.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliverAddressList;
  PaymentSummary({required this.deliverAddressList});

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
   reviewCartProvider.getReviewCartData();

    double discount = 30;
    double discountValue;
    double shippingChanrge = 3.7;
    double total;
   // // double totalPrice=1000;
   //  double totalPrice = reviewCartProvider.getTotalPrice();
   //  if (totalPrice > 300) {
   //    discountValue = (totalPrice * discount) / 100;
   //    total = totalPrice - discountValue;
   //  }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Summary",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\Rs 860",
          //"\$${total + 5 ?? totalPrice}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              // myType == AddressTypes.OnlinePayment
              //     ? Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => MyGooglePay(
              //             total: total,
              //           ),
              //         ),
              //       )
              //     : Container();

            },
            child: Text(
              "Place Order",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            color: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleDeliveryItem(
                 address:
                  "area, ${widget.deliverAddressList.area}, street, ${widget.deliverAddressList.street}, society ${widget.deliverAddressList.society}, pincode ${widget.deliverAddressList.pinCode}",
                  title:
                  "${widget.deliverAddressList.firstName} ${widget.deliverAddressList.lastName}",
                  number: widget.deliverAddressList.mobileNo,
                  addressType: widget.deliverAddressList.addressType ==
                      "AddressTypes.Home"
                      ? "Home"
                      : widget.deliverAddressList.addressType ==
                      "AddressTypes.Other"
                      ? "Other"
                      : "Work",
                ),
                Divider(),
                ExpansionTile(
                  children: reviewCartProvider.getReviewCartDataList.map((e) {
                    return OrderItem(
                      e: e,
                    );
                  }).toList(),
                  title: Text(
                      "Order Items ${reviewCartProvider.getReviewCartDataList.length}"),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Sub Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "\Rs. 800",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\Rs 50",
                    //"\$$discountValue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Coupon Discount",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\Rs.10",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text("Payment Options"),
                ),
                RadioListTile(
                  value: AddressTypes.Home,
                  groupValue: myType,
                  title: Text("Home"),
                  onChanged: (value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.work,
                    color: Colors.purple,
                  ),
                ),
                RadioListTile(
                  value: AddressTypes.OnlinePayment,
                  groupValue: myType,
                  title: Text("OnlinePayment"),
                  onChanged: (value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.devices_other,
                    color: Colors.purple,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}