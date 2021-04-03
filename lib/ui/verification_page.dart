import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kunime_app/common/enum.dart';
import 'package:kunime_app/common/styles.dart';
import 'package:kunime_app/data/provider/user_provider.dart';
import 'package:kunime_app/widgets/button/disable_button.dart';
import 'package:kunime_app/widgets/button/primary_button.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  UserProvider _userProvider;
  TextEditingController _otpController = TextEditingController();
  ColorBuilder _otpBorder = PinListenColorBuilder(
    primaryColor,
    borderColor,
  );
  // TIMER
  Timer _timer;
  int _start = 60;
  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start < 1) {
          timer.cancel();
        } else {
          _start = _start - 1;
        }
      });
    });
  }

  @override
  void initState() {
    this._startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _handleChangeOTP(String code) async {
    if (code.length == 6) {
      if (_userProvider != null && _userProvider.isVerifyOTP(code)) {
        _userProvider.setPhoneToStorage();
      } else {
        _showMessage("Kode verifikasi salah!", isError: true);
        setState(() {
          _otpBorder = PinListenColorBuilder(
            redColor,
            borderColor,
          );
        });
      }
    } else {
      setState(() {
        _otpBorder = PinListenColorBuilder(
          primaryColor,
          borderColor,
        );
      });
    }
  }

  void _showMessage(String message, {bool isError = false}) {
    Color _background = isError ? redColor : greenSecondaryColor;
    final _snackBar = SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: _background,
      content: Text(
        message,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: secondaryColor,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    this._userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: ScaffoldMessenger(
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/verification.png",
                    width: 240,
                    height: 200,
                  ),
                  SizedBox(height: 25),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Text(
                      "Masukkan kode verifikasi!",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: PinInputTextField(
                      pinLength: 6,
                      enabled: true,
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      decoration: BoxLooseDecoration(
                        strokeColorBuilder: _otpBorder,
                      ),
                      onChanged: _handleChangeOTP,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.all(25),
              child: _start > 0
                  ? DisableButton(
                      text: "Kirim ulang ($_start)",
                    )
                  : Consumer<UserProvider>(
                      builder: (context, provider, child) {
                        if (provider.isLoading == STATUS.Loading) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                backgroundColor: primaryColor,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    secondaryColor),
                              ),
                            ],
                          );
                        }
                        return PrimaryButton(
                          text: "Kirim ulang",
                          onPressed: () {
                            provider.setUserPhone(isResend: true);
                            _showMessage("Kode verifikasi telah terkirim!");
                            setState(() {
                              _start = 60;
                            });
                            this._startTimer();
                          },
                        );
                      },
                    ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
