import 'package:flutter/material.dart';

class About extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
            "About FixIt App",
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
                    title: Text("There are various house service requirements in our everyday lives. Looking for good service is a typical job. "+
                  "\nIn the market there are a wide range of service providers and finding a trusted one is not an easy task."+
                  "\n There are other problems such as unsatisfied negotiations in prices, dealing with unprofessional behavior and odd working hours. "+
                  "\nIncluding these, fair wages and employment to the local handyman is also an issue. "+
                  "\nFixIt brings modern solutions for such problems, this on demand service application hires trusted professionals for different types of tasks. "+
                  "\nThis app provides repair service for machines like AC, air cooler, air purifier, chimney, geyser, microwave, refrigerator, washing machine, TV and water purifier. "+
              "\nAlso there are various cleaning services for bathroom, kitchen, sofa, carpet and entire home. In addition to this, pest control services, electrician, plumber, carpenters, steel fabricators, home painting and  waterproofing are also available.",
              ),


                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

