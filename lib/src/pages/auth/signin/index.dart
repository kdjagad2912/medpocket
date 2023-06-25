import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medpocket/src/api/auth.dart';
import 'package:medpocket/src/components/styles/CustomTextStyle.dart';
import 'package:medpocket/src/components/ui/CustomTextField.dart';
import 'package:medpocket/src/components/ui/ThemeButton.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final mobileNumber = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    ThemeData? theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                    child: LottieBuilder.network(
                  "https://assets2.lottiefiles.com/packages/lf20_bu1y6oml.json",
                  width: 200,
                )),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
              //   child: Text("Signin", style: h1(context)),
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: CustomTextField(
                  baseColor: Colors.grey,
                  borderColor: Colors.grey,
                  errorColor: Colors.red,
                  controller: mobileNumber,
                  hint: "Mobile Number",
                  inputType: TextInputType.phone,
                  validator: () => {},
                  onChanged: () => {},
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: ThemeButton(
                      loading: loading,
                      onClick: () {
                        setState(() {
                          loading = true;
                        });
                        auth(mobileNumber.text).then((value) {
                          setState(() {
                            loading = false;
                          });
                          if (value['status'] == 1) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                '/verify', (Route<dynamic> route) => false,
                                arguments: {"mobile": mobileNumber.text});
                          }
                        });
                      },
                      text: "Signin",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: const Text("Forgot"),
                                  content: const Text("Forgot Password"),
                                  actions: [
                                    ThemeButton(
                                        onClick: () =>
                                            Navigator.pop(context, false),
                                        text: "OK")
                                  ],
                                )).then((exit) {
                          return false;
                        });
                      },
                      child: Text(
                        "Forgot Password?",
                        style: body(context).copyWith(
                            color: theme.primaryColorDark,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
