import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_flutter/screens/widget/count.dart';

import '../../providers/reviewcart_provider.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  String heading ;
  String img ;
  String serviceID;
  int serviceQuantity ;
  String price;
  VoidCallback onDelete;

  SingleItem({ required this.isBool,
   required this.heading ,
   required this.img,
    required this.serviceQuantity,
  required this.price,
    required this.serviceID,
     required this.onDelete,
  });
  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SingleItem> {
  //get onDelete => null;

 // bool isBool = false;
  //SingleItem({isBool})
late ReviewCartProvider reviewCartProvider;
late int count;
getCount(){
  setState(() {
    count=widget.serviceQuantity;
  });
}
@override
void initState(){
  getCount();
  super.initState();
}
  @override
  Widget build(BuildContext context){
    
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Column(
        children: [
          Padding(
      padding: const EdgeInsets.symmetric(horizontal:10),
      child: Row(
        children:
          [
            Expanded(child: Container(
              height: 100,
              child: Center(
                child: Image.network(widget.img),
              ),
            ),
            ),
            Expanded(child: Container(
              height: 100,
              child:
                Column(
                  mainAxisAlignment: widget.isBool
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                    Text(widget.heading,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                 ),
                    // Text(widget.desc,
                    //   style: TextStyle(
                    //     color: Colors.grey,
                    //   ),
                    // ),
                        Text("Rs. "+widget.price,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                  ],
                ),
            widget.isBool==false
                    ?GestureDetector(
              onTap:(){
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: new Text('Basic'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: new Text('Complex'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });},
            child: Container(
              margin: EdgeInsets.only(right:20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 25,
              decoration:BoxDecoration(
                border: Border.all(color:Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child:
                Row(
                  children: [
                    Expanded(
                      child:
                      Text("Basic",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize:14,
                        ),
                      ),
                    ),
                    Center(
                      child: Icon(Icons.arrow_drop_down,size:20, color:Colors.black),
                    ),
                  ],
                ),
            )): Text(widget.price)
      ],

      ),
            ),
            ),
            Expanded(child: Container(
              height: 125,
              padding: widget.isBool==false
                  ? EdgeInsets.symmetric(horizontal: 15,vertical: 32)
                  : EdgeInsets.only(left: 15,right: 15),
              child: widget.isBool == false
    //           Column(
    //           children: [
    // Icon(Icons.delete,
    // size:30,
    // color: Colors.black54),
    // SizedBox(
    // height: 5,
    // ),
             ? Count(serviceID: widget.serviceID,
                img: widget.img,
                heading: widget.heading,
                price: widget.price,)
              :Padding(
         padding: const EdgeInsets.only(top: 10),
              child:Column(
              children: [
                InkWell(
                  onTap:
                    widget.onDelete,
                child:Icon(Icons.delete,
                    size:30,
                    color: Colors.black54),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height:25,
                  width: 70,
                  decoration:BoxDecoration(
                    border: Border.all(color:Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:Center(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove,
                          color:Colors.black,
                          size:20,
                        ),
                        Text("1",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize:14,
                          ),
                        ),
                        Icon(
                          Icons.add,
                          color:Colors.black,
                          size:20,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
              ),
              ),
            ),
            ),

          ],
      ),
    ),
          widget.isBool
              ?Container()
              :Divider(
            height: 1,
            color: Colors.black54,)
        ],
            );
  }
}