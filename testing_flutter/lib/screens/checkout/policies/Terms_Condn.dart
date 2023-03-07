import 'package:flutter/material.dart';

class TermsCondition extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
            "Terms and Condition",
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
                      title: Text("1.Introduction: These terms and conditions (“Terms”) govern your use of the Service Provider App (“App”), which is owned and operated by FixIt. By using the App, you agree to be bound by these Terms. If you do not agree to these Terms, do not use the App."+
                          "\n\n2.Eligibility: The App is intended for use only by individuals who are at least 18 years of age. By using the App, you represent and warrant that you are 18 years of age or older."+
                          "\n\n3.License to Use App: Subject to your compliance with these Terms, FixIt App grants you a limited, non-exclusive, non-transferable, revocable license to access and use the App for your personal use."+
                          "\n\n4.User Content: The App may allow you to submit, upload, publish or otherwise make available content, including but not limited to text, photographs, videos and audio (“User Content”). You retain all rights in, and are solely responsible for, the User Content you make available through the App."+
                  " \n\n5. Proprietary Rights: The App and its entire contents, features, and functionality (including but not limited to all information, software, text, displays, images, video, and audio, and the design, selection, and arrangement thereof), are owned by FixIt App, its licensors, or other providers of such material and are protected by United States and international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws. These Terms permit you to use the App for your personal, non-commercial use only."+
               " \n\n6.Modification of Terms: FixIt App reserves the right to modify these Terms at any time in its sole discretion. If FixIt App modifies these Terms, it will post the modification on the App or provide you with notice of the modification. By continuing to use the App after FixIt App has posted a modification, you agree to be bound by the modified Terms. If the modified Terms are not acceptable to you, your only recourse is to cease using the App."+
                "\n\n7.Termination: FixIt App may, in its sole discretion, at any time terminate or suspend all or a portion of the App, or your use of all or a portion of the App, with or without notice and with or without cause."+
                "\n\n8.Disclaimer of Warranty: THE APP IS PROVIDED ON AN 'AS IS' AND 'AS AVAILABLE' BASIS. FixIt App MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THE APP OR THE INFORMATION, CONTENT, MATERIALS, OR PRODUCTS INCLUDED ON THE APP. YOU EXPRESSLY AGREE THAT YOUR USE OF THE APP IS AT YOUR SOLE RISK."+
                "\n\n9.Limitation of Liability: FixIt App WILL NOT BE LIABLE FOR ANY DAMAGES OF ANY KIND INCLUDING, WITHOUT LIMITATION, DIRECT, INDIRECT, INCIDENTAL, PUNITIVE, AND CONSEQUENTIAL DAMAGES, ARISING OUT OF YOUR USE OF THE APP."

                "\n\n10.Indemnification: You agree to defend, indemnify and hold FixIt App, its affiliates, licensors, and service providers, and its and their respective officers, directors, employees, contractors, agents, licensors, suppliers, successors, and assigns harmless from and against any claims, liabilities, damages, judgments, awards, losses, costs",

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
    
