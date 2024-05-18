import 'package:firtstproj/ImagePickerPage.dart';
import 'package:firtstproj/NavigationDrawerPage.dart';
import 'package:firtstproj/SampleApiCallPage.dart';
import 'package:firtstproj/SharedPreferencePage.dart';
import 'package:firtstproj/ThirdPage.dart';
import 'package:firtstproj/WebViewPage.dart';
import 'package:firtstproj/custom_dialog_box.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SecondPage.dart';
import 'ListviewPage.dart';
import 'TabView.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;


main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/second': (context) => SecondPage(text: '',),
        '/third': (context) => ThirdPage(),
        '/ListViewPage': (context) => ListViewPage(),
        '/TabView': (context) => TabView(),
        '/SharedPreferencePage': (context) => SharedPreferencePage(),
        '/NavigationDrawerPage': (context) => NavigationDrawerPage(),
        '/ImagePickerPage': (context) => ImagePickerPage(),
        '/WebViewPage': (context) => WebViewPage(),
        '/SampleApiCallPage': (context) => SampleApiCallPage(),
        '/CustomDialogBox': (context) => CustomDialogBox(text: '', title: '', descriptions: '', img: Image(image: AssetImage('images/ic_video_inactive_new.png')),),
      },
    );
  }
}




