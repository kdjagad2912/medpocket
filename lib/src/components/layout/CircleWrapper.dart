import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class CircleWrapper extends StatefulWidget {
  final Widget child;
  const CircleWrapper({Key? key, required this.child}) : super(key: key);

  @override
  State<CircleWrapper> createState() => _CircleWrapperState();
}

class _CircleWrapperState extends State<CircleWrapper> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [themeData.primaryColor,themeData.primaryColorDark]
          // ),

          borderRadius: const BorderRadius.all(Radius.circular(1000)),
          boxShadow: const [
            BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 7,offset: Offset(5, 5)),
          ],
          border: GradientBoxBorder(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                stops: [0,0.5,0.7],
                colors: [themeData.primaryColor,themeData.primaryColorDark, Colors.white10]),
            width: 5,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
