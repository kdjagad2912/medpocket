import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyStockiestCard extends StatelessWidget {
  final dynamic item;
  const CompanyStockiestCard({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: () => {
        Navigator.pushNamed(context, '/stockiest-company',
            arguments: {"companyName": item['COMPANY_NAME']})
      },
      child: Card(
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
                stops: [0, 1],
                colors: [
                  themeData.primaryColor,
                  themeData.primaryColorDark,
                ],
              ).createShader(bounds),
              child: Icon(
                Icons.business,
                size: 40,
              )),
          title: Text(item['COMPANY_NAME']),
          // subtitle: Text(item['Strength']),
          dense: true,
        ),
      ),
    );
  }
}
