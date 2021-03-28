import 'package:flutter/material.dart';
import 'package:kunime_app/common/navigation.dart';
import 'package:kunime_app/common/styles.dart';
import 'package:kunime_app/common/route.dart' as routes;
import 'package:kunime_app/data/provider/user_provider.dart';
import 'package:kunime_app/widgets/button/primary_button.dart';
import 'package:kunime_app/widgets/inputfield/input.field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController();
  final _formLoginKey = GlobalKey<FormState>();

  String _loginTitle = "Masukkan nomor HP";

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: _formLoginKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/login.png",
                    width: 240,
                    height: 200,
                  ),
                  SizedBox(height: 25),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Text(
                      _loginTitle,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: InputField(
                      hintText: "089545xxxxxx",
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Nomor HP wajib diisi!';
                        } else if (value.length < 10) {
                          return 'Nomor HP tidak valid';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.all(25),
            child: Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                return PrimaryButton(
                  text: "Lanjut",
                  onPressed: () {
                    bool _isValid = _formLoginKey.currentState.validate();

                    if (_isValid) {
                      userProvider.setUserPhone(_phoneController.text);
                      Navigation.navigate(routes.VerificationRoute);
                    }
                  },
                );
              },
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
