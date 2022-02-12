import 'package:favours_app/data/mock_values.dart';
import 'package:favours_app/pages/FavoursPage.dart';
import 'package:favours_app/pages/RequestFavourPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ThemeData lightTheme = ThemeData(
      primaryColor: Colors.lightGreen.shade600,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen)
          .copyWith(secondary: Colors.orangeAccent.shade400),
      // primaryColorBrightness: Brightness.dark,
      // textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      cardColor: Colors.lightGreen.shade100);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Favours App',
        debugShowCheckedModeBanner: false,
        theme: lightTheme.copyWith(
          textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
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
            ));
  }
}
