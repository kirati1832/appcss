import 'package:appcsall/presentation/webview/viewweb_csb_download.dart';
import 'package:appcsall/presentation/widget/horizontalMenu.dart';
import 'package:appcsall/presentation/page/Footer.dart';
import 'package:appcsall/presentation/page/HomePage.dart';
import 'package:appcsall/presentation/page/HistoryPage.dart';
import 'package:appcsall/presentation/page/LoginPage.dart';
import 'package:appcsall/presentation/page/MainsPage.dart';
import 'package:appcsall/presentation/page/menusubPage.dart';
import 'package:appcsall/presentation/page/Register.dart';
import 'package:appcsall/presentation/page/Footer.dart';
import 'package:flutter/material.dart';
import 'package:appcsall/presentation/page/StaffPage.dart';
import 'package:appcsall/presentation/page/HistoryPage.dart';
import 'package:appcsall/presentation/page/StudentlinkPage.dart';
import 'package:appcsall/presentation/page/LoginPage.dart';
import 'package:appcsall/presentation/page/url.dart';
import 'presentation/q/CSGreen.dart';
import 'presentation/q/Organization.dart';
import 'presentation/q/course.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/contact': (context) => FooterWidget(),
          '/': (cotext) => MyHomePage(title: "CS KMUTNB"),
          '/submenu': (context) => Menusubmain(),
          '/staff': (context) => PersonnelScreen(),
          '/student':(context) => StudentLinkPage(),
          '/history':(context)=>Hitorymain(),
          '/login':(context)=>Logins(),
          '/logins':(context)=>LoginPage(),
          '/register':(context)=>RegisterPage(),
          '/webview':(context)=>webview(),
          '/csgreen':(context)=>CSGreen(),
          '/organization':(context)=>Organization(),
          '/course':(context)=>course(),
        });
  }
}
