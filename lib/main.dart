import 'package:flutter/material.dart';
import 'package:safypowerfinal/Views/FlutterMapView.dart';
import 'Views/CustomProfileView.dart';
import 'views/create_account_view.dart';
import 'views/verify_code_view.dart';
import 'views/login_view.dart';
import 'views/home_view.dart';
import 'views/profile_view.dart';
import 'views/history_view.dart';
void delayFunction(Duration? duration) {

}
void main() {
  int delayMilliseconds = 1000;


  Duration delayDuration = Duration(milliseconds: delayMilliseconds);

  delayFunction(delayDuration);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafyPower',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/login',
      routes: {
        '/createAccount': (context) => CreateAccountView(),
        '/verifyCode': (context) => VerifyCodeView(),
        '/login': (context) => LoginView(),
        '/home': (context) => HomeView(),
        '/profile': (context) => ProfileView(),
        '/history': (context) => HistoryView(),
        '/map': (context) => FlutterMapView(),
        '/customProfile': (context) => CustomProfileView(), // Corrected route

      },
    );
  }




}
