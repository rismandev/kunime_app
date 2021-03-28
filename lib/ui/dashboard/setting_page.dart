import 'package:flutter/material.dart';
import 'package:kunime_app/common/navigation.dart';
import 'package:kunime_app/common/styles.dart';
import 'package:kunime_app/data/provider/user_provider.dart';
import 'package:kunime_app/widgets/appbar/custom_appbar.dart';
import 'package:kunime_app/widgets/button/setting_button.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _top = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            padding: EdgeInsets.fromLTRB(10, 20 + _top, 25, 20),
            child: _buildAppBar(context),
          ),
          SettingButton(
            text: "Syarat & Ketentuan",
            icon: "assets/icons/icon_faq.png",
            onPressed: () {
              print("FAQ");
            },
          ),
          SettingButton(
            text: "Pengaturan Bahasa",
            icon: "assets/icons/icon_flag.png",
            onPressed: () {
              print("Bahasa");
            },
          ),
          SettingButton(
            text: "Pengaturan Tema",
            icon: "assets/icons/icon_theme.png",
            onPressed: () {
              print("Tema");
            },
          ),
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return SettingButton(
                text: "Keluar",
                icon: "assets/icons/icon_logout.png",
                onPressed: () => userProvider.deleteUserPhone(),
              );
            },
          ),
        ],
      ),
    );
  }

  Row _buildAppBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          iconSize: 25,
          padding: EdgeInsets.all(5),
          highlightColor: secondaryColor,
          hoverColor: secondaryColor,
          splashColor: secondaryColor,
          onPressed: () => Navigation.back(),
          icon: Icon(
            Icons.chevron_left,
            color: secondaryColor,
          ),
        ),
        SizedBox(width: 15),
        Text(
          "Pengaturan",
          style: Theme.of(context).textTheme.headline5.copyWith(
              color: secondaryColor,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5),
        ),
      ],
    );
  }
}
