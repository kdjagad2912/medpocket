import 'package:flutter/material.dart';
import 'package:medpocket/src/components/styles/CustomTextStyle.dart';

class ThemeButton extends StatefulWidget {
  final Function onClick;
  final String text;
  final bool loading;
  const ThemeButton(
      {Key? key, required this.onClick, this.text = "", this.loading = false})
      : super(key: key);

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    ThemeData? theme = Theme.of(context);
    return PhysicalModel(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      elevation: 30.0,
      shadowColor: Colors.primaries.last,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [theme.primaryColor, theme.primaryColorDark],
              stops: const [0.0, 1],
            ),
          ),
          child: TextButton(
            onPressed: () => widget.onClick(),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 40, right: 40, top: 7, bottom: 7),
              child: ButtonTheme(
                child: Row(
                  children: [
                    Text(
                      widget.text,
                      style: body(context).copyWith(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                    if (widget.loading) ...[
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                      )
                    ]
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
