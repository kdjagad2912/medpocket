import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderShape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    double radius=15.0;

    var path = Path();
    path.lineTo(0, height);
    path.lineTo((width/1.5)-radius, height);
    path.quadraticBezierTo((width/1.5)-radius, height, width/1.5, height-radius);
    path.lineTo(width/1.5, height/2+radius);
    path.quadraticBezierTo(width/1.5, height/2+radius, width/1.5+radius, height/2);
    path.lineTo(width, height/2);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}