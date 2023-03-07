import 'package:flutter/material.dart';

class Faq extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
            "FAQs",
            style: TextStyle(color: Colors.black26)
        ),
      ),


      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(

                        "1.What is the FixIt App?"+
                        "The FixIt App is a platform that connects FixIts with customers looking for services. Customers can browse and compare services, book appointments, and make payments through the App."+
                            "\n\n2. Who can use the FixIt App?"+
                        "The App is intended for use by FixIts and customers. FixIts can create a profile, manage their services and schedule, and receive payment through the App. Customers can search for services, book appointments, and make payments through the App."+
                            "\n\n3. How do I create a profile on the FixIt App?"+
                        "To create a profile, you will need to download the App, create an account, and provide some basic information about yourself and your services. You will also need to upload a profile picture and select the services you would like to offer."+
                            "\n\n 4.How do I book an appointment on the FixIt App?"+
                       " To book an appointment, simply search for the desired service, select a FixIt, and choose the date and time that works best for you. You can then make a payment through the App and receive a confirmation of your appointment."+
                            "\n\n 5.How does payment work on the FixIt App?"+
                      " Payment is made through the App using a secure payment gateway. You will be prompted to enter your payment information when you book an appointment, and the payment will be processed automatically."+
                            "\n\n6.Is my personal and payment information secure on the FixIt App?"+
                        "Yes, we take the security of your personal and payment information seriously and use commercially reasonable security measures to protect it. However, no security measures are foolproof and we cannot guarantee the security of your information."+
                            "\n\n7.Who can I contact if I have questions or concerns about the FixIt App?"+
                        "If you have any questions or concerns, please contact us at 01127491677 or mail at fixitapp@gmail.com",
                      ),


                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

