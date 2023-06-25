import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:medpocket/src/actions/Actions.dart';
import 'package:medpocket/src/api/auth.dart';
import 'package:medpocket/src/app_state/AppState.dart';
import 'package:medpocket/src/components/styles/CustomTextStyle.dart';
import 'package:medpocket/src/components/ui/ThemeButton.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final otp = OtpFieldController();
  String otpValue = "";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    ThemeData? theme = Theme.of(context);
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    setToken(token) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("token", token);
    }

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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Center(
                    child: Text("Otp Sent To Mobile No. ${routes['mobile']}",
                        style: body(context)
                            .copyWith(fontSize: 18, color: Colors.black))),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SingleChildScrollView(
                  child: OTPTextField(
                      controller: otp,
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,
                      fieldStyle: FieldStyle.underline,
                      outlineBorderRadius: 15,
                      style: const TextStyle(fontSize: 17),
                      onChanged: (pin) {
                        setState(() {
                          otpValue = pin;
                        });
                        if (kDebugMode) {
                          print("Changed: $pin");
                        }
                      },
                      onCompleted: (pin) {
                        setState(() {
                          otpValue = pin;
                        });
                        if (kDebugMode) {
                          print("Completed: $pin");
                        }
                      }),
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
                        verify(routes['mobile']!, otpValue).then((res) {
                          setState(() {
                            loading = false;
                          });
                          if (res['status'] == 1) {
                            Fluttertoast.showToast(
                                msg: "OTP Verified",
                                toastLength: Toast.LENGTH_LONG);
                            setToken(res['token']);
                            final store = StoreProvider.of<AppState>(context);
                            store.dispatch(getToken(store));
                            Navigator.pushNamedAndRemoveUntil(context, '/home',
                                (Route<dynamic> route) => false);
                          } else {
                            Fluttertoast.showToast(
                                msg: res['message'],
                                toastLength: Toast.LENGTH_LONG);
                          }
                        });
                      },
                      text: "Verify",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: TextButton(
                      onPressed: () => auth(routes['mobile']!).then((res) => {
                            if (res['status'] == 1)
                              {
                                showDialog(
                                    context: context,
                                    builder: (builder) {
                                      return const AlertDialog(
                                        content: Text("Sent"),
                                      );
                                    })
                              }
                          }),
                      child: Text(
                        "Resend",
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
