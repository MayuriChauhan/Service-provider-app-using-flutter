import 'package:flutter/material.dart';
import 'package:testing_flutter/screens/widget/single_item.dart';

import '../../models/service_model.dart';
class Search extends StatefulWidget{
  final List<ServiceModel>search;
  Search({required this.search});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search>{
  String query ="";
  searchItem(String query){
    List<ServiceModel> searchService = widget.search.where((element){
      return element.heading.toLowerCase().contains(query);
    }).toList();
    return searchService;
  }

  @override
  Widget build(BuildContext context)
  {
    List<ServiceModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),

      body: ListView(
        children: [
          ListTile(
            title:Text("Items"),
          ),
          Container(
            height: 52,
            child: TextField(
              onChanged: (value){
                print(value);
                setState(()
                {
                  query = value;
                });
              },
              decoration:InputDecoration(
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(30),
                 borderSide:BorderSide.none,
               ),
                fillColor: Color(0xffc2c2c2),
                filled:true,
               hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Column(
            children: _searchItem.map((data){
              return SingleItem( isBool: false,
              heading: data.heading,
                img: data.img,
                serviceID: data.serviceID,
                onDelete: (){},
                serviceQuantity: 1,
                price: data.price
            );
          }).toList(),

          )
        ],
      ),
    );
  }
}