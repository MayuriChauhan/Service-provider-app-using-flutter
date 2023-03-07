import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/delivery_address_model.dart';

class CheckoutProvider with ChangeNotifier {
  bool isloadding = false;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController alternateMobileNo = TextEditingController();
  TextEditingController society= TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pincode = TextEditingController();
  var setLoaction;

  void validator(context, myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "firstname is empty");
    }
    else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(firstName.text)) {
      Fluttertoast.showToast(
          msg: "First Name:  Input must contain only alphabetical characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "lastname is empty");
    }
    else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(lastName.text)) {
      Fluttertoast.showToast(
          msg: "Last Name: Input must contain only alphabetical characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if (mobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "mobileNo is empty");
    }
    else if (!RegExp(r"^[0-9]{10}$").hasMatch(mobileNo.text)) {
      Fluttertoast.showToast(
          msg: "Mobile No : Invalid phone number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if (alternateMobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "alternateMobileNo is empty");
    }
    else if (!RegExp(r"^[0-9]{10}$").hasMatch(alternateMobileNo.text)) {
      Fluttertoast.showToast(
          msg: "Alternative Mobile No : Invalid phone number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if (society.text.isEmpty) {
      Fluttertoast.showToast(msg: "society is empty");
    }
    else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(society.text)) {
      Fluttertoast.showToast(
          msg: "Society: Input must contain only alphabetical characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: "street is empty");
    }
    else if (!RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(street.text)) {
      Fluttertoast.showToast(
          msg: "Street: Input must contain only alphanumeric characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(society.text)) {
      Fluttertoast.showToast(
          msg: "Society: Input must contain only alphabetical characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else if (landmark.text.isEmpty) {
      Fluttertoast.showToast(msg: "landmark is empty");
    }
    else if (!RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(landmark.text)) {
      Fluttertoast.showToast(
          msg: "Landmark: Input must contain only alphanumeric characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "city is empty");
    }
    else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(city.text)) {
      Fluttertoast.showToast(
          msg: "City: Input must contain only alphabetical characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if (area.text.isEmpty) {
      Fluttertoast.showToast(msg: "area is empty");
    }
    else if (!RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(area.text)) {
      Fluttertoast.showToast(
          msg: "Area: Input must contain only alphanumeric characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if (pincode.text.isEmpty) {
      Fluttertoast.showToast(msg: "pincode is empty");
    }
    else if (!RegExp(r"^[0-9]{6}$").hasMatch(pincode.text)) {
      Fluttertoast.showToast(
          msg: "Invalid pincode( 6 digit numeric value) ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else {
      isloadding = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("AddDeliverAddress")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "firstname": firstName.text,
        "lastname": lastName.text,
        "mobileNo": mobileNo.text,
        "alternateMobileNo": alternateMobileNo.text,
        "society": society.text,
        "street": street.text,
        "landmark": landmark.text,
        "city": city.text,
        "area": area.text,
        "pincode": pincode.text,
        "addressType": myType.toString(),
      }).then((value) async {
        isloadding = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "Adding your deliver address");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  List<DeliveryAddressModel> deliveryAdressList = [];
  getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];

    DeliveryAddressModel deliveryAddressModel;
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("AddDeliverAddress")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (_db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        firstName: _db.get("firstname"),
        lastName: _db.get("lastname"),
        addressType: _db.get("addressType"),
        area: _db.get("area"),
        alternateMobileNo: _db.get("alternateMobileNo"),
        city: _db.get("city"),
        landMark: _db.get("landmark"),
        mobileNo: _db.get("mobileNo"),
        pinCode: _db.get("pincode"),
        society: _db.get("society"),
        street: _db.get("street"),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }

    deliveryAdressList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryAddressList {
    return deliveryAdressList;
  }

}