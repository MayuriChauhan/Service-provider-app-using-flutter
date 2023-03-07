import 'package:flutter/material.dart';
import 'package:testing_flutter/screens/home_screen/Question/faq.dart';
import 'package:testing_flutter/screens/home_screen/home_screen.dart';
import 'package:testing_flutter/screens/review_cart/reviewcart.dart';
import '../my_profile/my_profile.dart';


class DrawerSide extends StatefulWidget {
  //UserProvider userProvider;
  // DrawerSide({super.key}) ;
    @override
    _DrawerSideState createState() => _DrawerSideState();

}

class _DrawerSideState extends State<DrawerSide> {


  Widget listTile({ required String title, required IconData iconData,required Function onTap }) {
    return
      Container(
        height: 50,
        child: ListTile(
          leading: Icon(
            iconData,
            size: 32,
          ),
          title: Text(title, style: const TextStyle(color: Colors.black45)),
          onTap: () {
            if(title == "My Profile") {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyProfile(),
                ),
              );
            }
            else if (title == "Review Cart"){
            Navigator.of(context).push(
            MaterialPageRoute(
            builder: (context) => ReviewCart(),
                ),
              );
            }
            else
            if(title == "Home") {
            Navigator.of(context).push(
            MaterialPageRoute(
            builder: (context) => HomeScreen(),
            ),
            );
            }
            else
            if(title == "FAQs") {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Faq(),
                ),
              );
            }
          },
    ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 43,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.black26,
                    backgroundImage: NetworkImage(
                        "https://dcassetcdn.com/design_img/3721872/756694/22517463/xvg21se5vmq4yaezp6dweradte_image.jpg",
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome Guest"),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 30,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text("Login"),

                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          listTile(iconData : Icons.home_outlined, title: "Home", onTap: () {},),
          listTile(iconData : Icons.shop_outlined, title: "Review Cart",onTap: () {},),
          listTile(iconData : Icons.person_outlined, title: "My Profile",onTap: () {},),
          listTile(iconData : Icons.notifications_outlined, title: "Notification",onTap: () {},),
          listTile(iconData : Icons.star_outlined, title: "Rating & Review",onTap: () {},),
          listTile(iconData : Icons.favorite_outlined, title: "Wishlist",onTap: () {},),
          listTile(iconData : Icons.copy_outlined, title: "Raise a Complaint",onTap: () {},),
          listTile(iconData : Icons.format_quote_outlined, title: "FAQs",onTap: () {},),

          Container(
            height:350,
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Contact Support"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Call us: "),
                    SizedBox(
                      width: 10,
                    ),
                    Text("01127491677"),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text("Mail us: "),
                      SizedBox(
                        width: 10,
                      ),
                      Text("fixitapp@gmail.com"),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }


}