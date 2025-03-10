import 'package:appcsall/credit_page.dart';
import 'package:appcsall/presentation/news/news_list_screen_riverpod.dart';
import 'package:appcsall/presentation/page/stafflinkpage.dart';
import 'package:appcsall/presentation/student/student_advisors_screen.dart';
import 'package:appcsall/presentation/student/student_screen.dart';
import 'package:appcsall/presentation/page/Footer.dart';
import 'package:appcsall/presentation/page/HomePage.dart';
import 'package:appcsall/presentation/page/HistoryPage.dart';
import 'package:appcsall/presentation/page/LoginPage.dart';
import 'package:appcsall/presentation/page/MainsPage.dart';
import 'package:appcsall/presentation/page/menusubPage.dart';
import 'package:appcsall/presentation/page/Register.dart';
import 'package:flutter/material.dart';
import 'package:appcsall/presentation/page/StaffPage.dart';
import 'package:appcsall/presentation/page/StudentlinkPage.dart';
import 'presentation/q/CSGreen.dart';
import 'presentation/q/Organization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:appcsall/provider/connectivityProvider.dart';
import 'package:appcsall/presentation/page/NoInternetScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivity = ref.watch(connectivityProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        // เช็คว่ามีอินเทอร์เน็ตหรือไม่
        if (connectivity.asData?.value == ConnectivityResult.none) {
          return NoInternetScreen(); // แสดงหน้าล็อคเมื่อไม่มีอินเทอร์เน็ต
        }
        return child!;
      },
      initialRoute: '/',
      routes: {
        '/contact': (context) => FooterWidget(),
        '/': (context) => MyHomePage(title: "CS KMUTNB"),
        '/submenu': (context) => Menusubmain(),
        '/staff': (context) => PersonnelScreen(),
        '/history': (context) => Hitorymain(),
        '/login': (context) => Logins(),
        '/logins': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/csgreen': (context) => CSGreen(),
        '/organization': (context) => Organization(),
        '/stafflink': (context) => LinkPage(),
        '/studentlink': (context) => StudentLinkPage(),
        '/credit': (context) => CreditsPage(),
        '/news': (context) => NewsListScreenRiverpod(),
        '/student': (context) => StudentScreen(),
        '/advisors': (context) => StudentAdvisorsScreen(),
      },
    );
  }
}

