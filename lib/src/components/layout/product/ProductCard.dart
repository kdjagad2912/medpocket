import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCard extends StatelessWidget {
  final dynamic item;
  const ProductCard({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200)
      ),
      child: ListTile(
        leading: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) => LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0, 1],
              colors: [
                themeData.primaryColor,
                themeData.primaryColorDark,
              ],
            ).createShader(bounds),
            child:FaIcon(
              FontAwesomeIcons.capsules,
              size: 40,
            ) ),
        title: Text("${item['BRAND']} - ${item['FORM']}"),
        subtitle: Text(item['MRP']),
        dense: true,
      ),
    );
  }
}
