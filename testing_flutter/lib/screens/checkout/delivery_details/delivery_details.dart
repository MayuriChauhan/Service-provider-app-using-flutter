import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:testing_flutter/screens/checkout/delivery_details/single_delivery_item.dart';

import '../../../config/colors.dart';
import '../../../models/delivery_address_model.dart';
import '../../../providers/check_out_provider.dart';
import '../add_delivery_address/add_delivery_address.dart';
import '../payment_summary.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryAddressModel value;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliverAddress(

              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        // width: 160,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Text("Add new Address")
              : Text("Payment Summary"),
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty?
                Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddDeliverAddress(),
              ),
            )
               : Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PaymentSummary(
                  deliverAddressList: value,
                ),
              ),
            );
          },
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Deliver To"),
          ),
          Divider(
            height: 1,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Center(
            child: Container(
              child: Center(
                child: Text("No Data"),
              ),
            ),
          )
              : Column(
            children: deliveryAddressProvider.getDeliveryAddressList
                .map<Widget>((e) {
              setState(() {
                value  = e;
              });
              return SingleDeliveryItem(
                address:
                "aera, ${e.area}, street, ${e.street}, society ${e.society}, pincode ${e.pinCode}",
                title: "${e.firstName} ${e.lastName}",
                number: e.mobileNo,
                addressType: e.addressType == "AddressTypes.Home"
                    ? "Home"
                    : e.addressType == "AddressTypes.Other"
                    ? "Other"
                    : "Work",
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}