import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testing_flutter/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testing_flutter/providers/check_out_provider.dart';
import 'package:testing_flutter/providers/reviewcart_provider.dart';
import 'package:testing_flutter/providers/service_provider.dart';
import 'package:testing_flutter/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:testing_flutter/providers/user_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ServiceProvider>(
    create: (context)=>ServiceProvider(),
    ),
    ChangeNotifierProvider<UserProvider>(
    create: (context)=>UserProvider(),
    ),
      ChangeNotifierProvider<ReviewCartProvider>(
        create: (context)=>ReviewCartProvider(),
      ),
      ChangeNotifierProvider<CheckoutProvider>(
        create: (context)=>CheckoutProvider(),
      ),
    ],
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
    home: StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapShot) {
    if (snapShot.hasData) {
    return HomeScreen();
    }
    return SignIn();
    },),
    )
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//
//         title: Text(widget.title),
//       ),
//       body: Center(
//
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//
//
