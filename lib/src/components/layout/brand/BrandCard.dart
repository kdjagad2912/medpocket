import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final dynamic item;
  const BrandCard({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: () => {
        Navigator.pushNamed(context, '/product',
            arguments: {"brand": item['Name']})
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
        child: ListTile(
          leading: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) => LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0, 1],
                    colors: [
                      themeData.primaryColor,
                      themeData.primaryColorDark,
                    ],
                  ).createShader(bounds),
              child: const Icon(
                Icons.branding_watermark_outlined,
                size: 40,
              )),
          title: Text(item['Name']),
          subtitle: Text(item['Strength']),
          dense: true,
        ),
      ),
    );
  }
}
