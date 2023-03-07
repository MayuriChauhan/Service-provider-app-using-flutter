import 'package:flutter/material.dart';
import 'package:testing_flutter/screens/home_screen/service_overview/service_overview.dart';
import '../widget/count.dart';

class singleProduct extends StatefulWidget {
  final Function onTap;
  final String img;
  final String heading;
  final String desc;
  final String details;
  final String price;
  final String serviceID;
  singleProduct({
    required this.onTap,
    required this.img,
    required this.heading,
    required this.desc,
    required this.details,
    required this.price,
    required this.serviceID
  });
 @override
  _singleProductState createState() => _singleProductState();
}

class _singleProductState extends State<singleProduct> {


  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child:
        Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 230,
              width: 150,
              //color: Colors.grey,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: GestureDetector(
                      onTap :
                          (){
                        Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ServiceOverview(
                          heading:widget.heading+" "+widget.desc,
                          img:widget.img,
                          price:widget.price,
                          desc:widget.details,
                          serviceID:widget.serviceID
                        ),
      ),
                      );
      },
                      child: Container(
                        height: 150,
                        padding: EdgeInsets.all(5),
                        width: double.infinity,
                        child: Image.network(
                          widget.img,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           widget.heading,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text("Rs. "+
                            widget.price,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                    onTap: (){
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
                                          });
                                    },
                                  child:
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                height: 20,
                                width: 0,
                                //color: Colors.red,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),

                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(child: Text('Basic',
                                      style: TextStyle(fontSize: 10),)),
                                    Expanded(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: Colors.black54,
                                      ),
                                    )
                                  ],
                                ),

                              ),),),
                              SizedBox(width: 2),
                              Count(serviceID: widget.serviceID,
                                img: widget.img,
                                heading: widget.heading,
                                price: widget.price,
                              ),
                            ],
                          ),
                        ],
                      ),
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


