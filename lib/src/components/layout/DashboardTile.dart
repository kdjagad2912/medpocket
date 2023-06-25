import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medpocket/src/components/layout/CircleWrapper.dart';
import 'package:medpocket/src/components/styles/CustomTextStyle.dart';

class DashboardTile extends StatefulWidget {
  final Widget icon;
  final String label;
  final Function onClick;
  const DashboardTile(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onClick})
      : super(key: key);

  @override
  State<DashboardTile> createState() => _DashboardTileState();
}

class _DashboardTileState extends State<DashboardTile> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return CircleWrapper(
      child: InkWell(
        onTap: () => widget.onClick(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShaderMask(
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
                child: widget.icon),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 30, left: 30),
              child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0, 1],
                        colors: [
                          themeData.primaryColor,
                          Colors.black54,
                        ],
                      ).createShader(bounds),
                  child: Center(
                      child: Text(
                    widget.label,
                    style: body(context).copyWith(color: Colors.black,fontSize: 18),
                    textAlign: TextAlign.center,
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
