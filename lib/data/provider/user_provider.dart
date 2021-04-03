import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kunime_app/common/enum.dart';
import 'package:kunime_app/common/function.dart';
import 'package:kunime_app/common/route.dart' as routes;
import 'package:kunime_app/common/navigation.dart';
import 'package:kunime_app/data/helper/preferences_helper.dart';
import 'package:kunime_app/ui/login_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class UserProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  UserProvider({@required this.preferencesHelper});

  String _userPhone;
  String _userOTP;
  String _userVerifyID;
  STATUS _isLoading;

  String get userPhone => _userPhone ?? '';
  String get userOTP => _userOTP ?? '';
  String get userVerifyID => _userVerifyID ?? '';
  STATUS get isLoading => _isLoading ?? STATUS.Initial;

  void setUserPhone({
    String phone,
    bool isResend = false,
  }) async {
    this._isLoading = STATUS.Loading;
    notifyListeners();
    this._userPhone = phone;
    auth.setLanguageCode("en");
    await auth.verifyPhoneNumber(
      phoneNumber: isResend ? this._userPhone : phone,
      timeout: Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) {
        this._userOTP = credential.smsCode;
        this._isLoading = STATUS.Success;
        notifyListeners();
        Navigation.navigate(routes.VerificationRoute);
      },
      verificationFailed: onVerificationFailed,
      codeSent: (String verificationId, int resendToken) {
        this._userVerifyID = verificationId;
        notifyListeners();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print(verificationId);
      },
    );
  }

  bool isVerifyOTP(String otp) {
    if (this._userOTP == otp) {
      return true;
    }
    return false;
  }

  void onVerificationFailed(FirebaseAuthException e) {
    this._isLoading = STATUS.Error;
    notifyListeners();
    if (e.code == 'invalid-phone-number') {
      showMessage(
        loginMessageKey.currentState,
        message: "Format No HP Salah!!",
        isError: true,
      );
    } else if (e.code == 'too-many-requests') {
      showMessage(
        loginMessageKey.currentState,
        message: "Permintaan telah melewati batas!!",
        isError: true,
      );
    } else {
      showMessage(
        loginMessageKey.currentState,
        message: "Terjadi Kesalahan!!",
        isError: true,
      );
    }
  }

  void setPhoneToStorage() async {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: this._userVerifyID,
      smsCode: this._userOTP,
    );

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(phoneAuthCredential);

    preferencesHelper.setUserPhone(this._userPhone);
    Navigation.pushAndRemove(routes.DashboardRoute);
  }

  void deleteUserPhone() async {
    await auth.currentUser.delete();
    preferencesHelper.setUserPhone('');
    Navigation.pushAndRemove(routes.WelcomeRoute);
  }
}
