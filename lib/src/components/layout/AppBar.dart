import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../custom_shapes/header_shape.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryColorDark = Theme.of(context).primaryColorDark;
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon:Navigator.canPop(context)?const FaIcon(FontAwesomeIcons.chevronLeft): const Icon(Icons.menu),
        onPressed: () {
          if(Navigator.canPop(context)){
            Navigator.pop(context);
          }else{
            Scaffold.of(context).openDrawer();
          }
        },
      ),
      automaticallyImplyLeading: true,
      elevation: 0,
      toolbarHeight: 70,

      flexibleSpace: ClipPath(
        clipper: HeaderShape(),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54, blurRadius: 100, spreadRadius: 100)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [primaryColor, primaryColorDark])),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
}
