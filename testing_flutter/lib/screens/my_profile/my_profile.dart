import 'package:flutter/material.dart';
import 'package:testing_flutter/screens/checkout/delivery_details/delivery_details.dart';
import 'package:testing_flutter/screens/checkout/policies/Terms_Condn.dart';
import 'package:testing_flutter/screens/checkout/policies/about.dart';
import 'package:testing_flutter/screens/checkout/policies/privacy_policy.dart';
import 'package:testing_flutter/screens/home_screen/drawer_side.dart';
import 'package:testing_flutter/screens/review_cart/reviewcart.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});
    @override
    _MyProfileState createState() => _MyProfileState();

}
class _MyProfileState extends State<MyProfile> {
  @override
  Widget listTile({required IconData icon, required String title, required onTap}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: (){
            if (title == "My Delivery Address") {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DeliveryDetails(),
                ),
              );
            }
            else if (title == "Terms & Conditons") {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TermsCondition(),
                ),
              );
            }
            else if (title == "Privacy Policy") {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PrivacyPolicy(),
                ),
              );
            }
            else if (title == "About") {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => About(),
                ),);
            }},)
      ],);}

  Widget build(BuildContext context) {
   // var userData = widget.userProvider.currentUserData;

    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),),),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: Colors.purple,
              ),
              Container(
                height: 548,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Gati Mayuri",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("abc@gmail.com"),
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.black12,
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.black12,
                                  ),
                                  backgroundColor: Colors.black12,
                                ),)
                            ],),
                        ),
                      ],),
                    listTile(icon: Icons.shop_outlined, title: "My Orders", onTap: () {}),
                    listTile(
                        icon: Icons.location_on_outlined,
                        title: "My Delivery Address", onTap: () {}),
                    listTile(
                        icon: Icons.person_outline, title: "Refer A Friends", onTap: () {}),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: "Terms & Conditions", onTap: () {}),
                    listTile(
                        icon: Icons.policy_outlined, title: "Privacy Policy", onTap: () {}),
                    listTile(icon: Icons.add_chart, title: "About", onTap: () {}),
                    listTile(
                        icon: Icons.exit_to_app_outlined, title: "Log Out", onTap: () {}),
                  ],),
              )
            ],),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.purple,
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                   // ..userData.userImage ??
                      "https://dcassetcdn.com/design_img/3721872/756694/22517463/xvg21se5vmq4yaezp6dweradte_image.jpg",
                  ),
                  radius: 45,
                  backgroundColor: Colors.white),
            ),)
        ],),
    );}}