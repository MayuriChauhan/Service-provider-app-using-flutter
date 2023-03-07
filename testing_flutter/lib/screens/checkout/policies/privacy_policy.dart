import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
            "Privacy Policy",
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

                "1.Introduction: This Privacy Policy describes how FixIt App (“we”, “us” or “our”) collects, uses, and shares information when you use our Service Provider App (“App”). By using the App, you agree to the collection, use, and sharing of your information as described in this Privacy Policy."+
                  "\n\n2.  Information We Collect: We collect information about you when you use the App, including:"+
     "\n\n3. Personal Information: We may collect personal information such as your name, email address, phone number, and address."+
     "\n Usage Information: We may collect information about how you use the App, including the frequency and duration of your use, the pages you visit, and the features you access."+
     "\n Location Information: We may collect information about your location if you choose to enable location services on your device."+
      "\n Device Information: We may collect information about the device you use to access the App, including the device type, operating system, and unique device identifier."+
      "\n\n Use of Information: We use the information we collect to provide and improve the App, to respond to your requests and inquiries, and for other purposes as described in this Privacy Policy."+
     "\n\n 4.Sharing of Information: We do not sell or rent your personal information to third parties. However, we may share your information with third-party service providers that perform services on our behalf, such as hosting the App, analyzing data, and providing customer support. We require these service providers to protect your information and use it only for the purposes for which it was disclosed."+
      "\n\n 5.Security: We take the security of your information seriously and use commercially reasonable security measures to protect it. However, no security measures are foolproof and we cannot guarantee the security of your information."+
      "\n\n6.International Data Transfer: The App may be accessed and used in other countries, which may have different data protection laws than your country of residence. By using the App, you consent to the transfer of your information to other countries."+
      "\n\n7.Data Retention: We retain your information for as long as necessary to provide the App and fulfill the purposes described in this Privacy Policy."+
     "\n\n8. Your Rights: You have the right to access, update, and delete your personal information. You also have the right to request that we stop using your information for certain purposes. To exercise these rights, please contact us using the contact information provided below."+
      "\n\n9.Changes to Privacy Policy: We may update this Privacy Policy from time to time to reflect changes in our practices or applicable laws. We will notify you of any material changes by posting the updated Privacy Policy on the App. By continuing to use the App after such changes, you agree to be bound by the updated Privacy Policy."+
      "\n\n10.Contact Us: If you have any questions or concerns about this Privacy Policy, please contact us at [insert contact information].",
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

