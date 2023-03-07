import 'package:flutter/material.dart';
import 'package:testing_flutter/screens/review_cart/reviewcart.dart';
import 'package:testing_flutter/screens/widget/count.dart';
import 'package:testing_flutter/screens/home_screen/single_product.dart';

class ServiceOverview extends StatefulWidget{

  final String heading;
  final String img;
  final String price;
  final String desc;
  final String serviceID;
  ServiceOverview(
      { required this.heading,
        required this.img,
        required this.price,
        required this.desc,
        required this.serviceID});
  @override
  State<ServiceOverview> createState() => _ServiceOverviewState();
}

enum SinginCharacter { fill, outline }

class _ServiceOverviewState extends State<ServiceOverview>{

  SinginCharacter _character = SinginCharacter.fill;
  SinginCharacter _character2 = SinginCharacter.fill;

  Widget buttonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    required Function onPressed,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: Row(
        children: [
        buttonNavigatorBar(
        backgroundColor: Colors.black,
        color: Colors.white70,
        iconColor: Colors.grey,
        title: "Add To WishList",
        iconData:Icons.favorite_outline, onPressed: () {},
        ),
      buttonNavigatorBar(
          backgroundColor:Colors.amber,
          color: Colors.black,
          iconColor: Colors.black,
          title: "Go to cart",
          iconData:Icons.shop_outlined, onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReviewCart(),),
          );
        },
      ),
      ],
        ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Service Overview",
          style: TextStyle(color: Colors.black26)
        ),
      ),


        body: Column(
      children: [
      Expanded(
      flex: 2,
        child: Container(
          width: double.infinity,
          child: Column(
              children: [
          ListTile(
          title: Text(widget.heading),
          subtitle: Text("\Basic"),
        ),
        Container(
            height: 200,
            padding: EdgeInsets.all(20),
            child: Image.network(
             widget.img??"",
            )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: double.infinity,
          child: Text(
            "Available Options",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Row(
          children: [
          CircleAvatar(
          radius: 3,
            backgroundColor: Colors.green[700],
          ),
          Radio(
            value: SinginCharacter.fill,
            groupValue: _character,
            activeColor: Colors.green[700],
            onChanged: (value) {
              setState(() {
                _character = value!;
              });
            },
          ),

          ],
        ),

        Text("\Rs "+widget.price),
              Count(serviceID: widget.serviceID,
                img: widget.img,
                heading: widget.heading,
                price: widget.price,

              ),
          ],
      ),
    ),
          ],
    ),
    ),
    ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: ListView(
              children: [
                Text(
                  "About This Service",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.desc,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
    );

  }

}