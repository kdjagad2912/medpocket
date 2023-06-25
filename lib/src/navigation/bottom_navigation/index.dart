import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:medpocket/src/components/layout/AppBar.dart';
import 'package:medpocket/src/custom_shapes/header_shape.dart';
import 'package:medpocket/src/pages/dashboard/index.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    String title = "Home";
    Widget child = Container();
    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryColorDark = Theme.of(context).primaryColorDark;
    switch (_index) {
      case 0:
        child = const Dashboard();
        title = "Home";
        break;
      case 1:
        child = const Center(child: Text("Profile"));
        title = "Profile";
        break;
      case 2:
        child = const Center(child: Text("News"));
        title = "News";
        break;
      case 3:
        child = const Center(child: Text("About us"));
        title = "About us";
        break;
    }
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text('Home'),
            ),
          ],
        ),
      ),
      appBar: CustomAppBar(
        title: title,
      ),
      body: SizedBox.expand(child: child),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        elevation: 50,
        showUnselectedLabels: false,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black26,
        items: [
          BottomNavigationBarItem(
            icon: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0, 1],
                      colors: [
                        primaryColor,
                        primaryColorDark,
                      ],
                    ).createShader(bounds),
                child: const Icon(Icons.home)),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0, 1],
                        colors: [
                          primaryColor,
                          primaryColorDark,
                        ],
                      ).createShader(bounds),
                  child: const Icon(Icons.person_2_outlined)),
              label: "Profile"),
          BottomNavigationBarItem(
              icon: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0, 1],
                        colors: [
                          primaryColor,
                          primaryColorDark,
                        ],
                      ).createShader(bounds),
                  child: const Icon(Icons.newspaper)),
              label: "News"),
          BottomNavigationBarItem(
              icon: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0, 1],
                        colors: [
                          primaryColor,
                          primaryColorDark,
                        ],
                      ).createShader(bounds),
                  child: const Icon(Icons.info_outline)),
              label: "About Us"),
        ],
      ),
    );
  }
}
