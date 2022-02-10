import 'package:favours_app/data/mock_values.dart';
import 'package:favours_app/pages/FavoursPage.dart';
import 'package:favours_app/pages/RequestFavourPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favours App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        RequestFavourPage.routeName: (_) => RequestFavourPage(
              friends: mockFriends,
            )
      },
      home: const FavoursPage(
          // pendingAnswerFavours: mockPendingFavors,
          // acceptedFavours: mockDoingFavors,
          // completedFavours: mockCompletedFavors,
          // refusedFavours: mockRefusedFavors
          ),
    );
  }
}
