import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:medpocket/src/navigation/bottom_navigation/index.dart';
import 'package:medpocket/src/pages/auth/signin/index.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInit extends StatefulWidget {
  const AppInit({super.key});

  @override
  State<AppInit> createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");
      // log(token ?? "no token");
      Widget child = const BottomNavigation();
      if (token == null) {
        child = const Signin();
      }

      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context)
            .pushReplacement(PageTransition(child: child, type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 700)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var children = [
      Lottie.network(
          "https://assets10.lottiefiles.com/packages/lf20_0fhlytwe.json",
          width: 300),
      Text("Med Pocket", style: Theme.of(context).textTheme.bodyLarge),
    ];

    return Scaffold(
      backgroundColor: const Color(0xfffefefe),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      )),
    );
  }
}
