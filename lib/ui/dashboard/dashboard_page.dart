import 'package:flutter/material.dart';
import 'package:kunime_app/common/navigation.dart';
import 'package:kunime_app/common/sizeconfig.dart';
import 'package:kunime_app/common/styles.dart';
import 'package:kunime_app/common/route.dart' as routes;
import 'package:kunime_app/data/model/category_model.dart';
import 'package:kunime_app/data/provider/quiz_provider.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double _left;
  double _topRight;

  @override
  void initState() {
    _left = SizeConfig.widthMultiplier * 100;
    _topRight = -250;
    _startAnimated();
    super.initState();
  }

  void _startAnimated() async {
    await Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _left = 0;
          _topRight = -125;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              SizedBox(height: 100),
              Container(
                child: Text(
                  "KunimeApp",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.8),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Pilih Anime untuk memulai Kuis",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: secondaryColor,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5),
                ),
              ),
              Expanded(
                child: Consumer<QuizProvider>(
                  builder: (context, quizProvider, child) {
                    // INITIALIZATION
                    if (quizProvider.categories.isEmpty) {
                      quizProvider.initCategory();
                    }

                    return GridView.builder(
                      itemCount: quizProvider.categories.length,
                      padding: EdgeInsets.all(25),
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 25,
                        mainAxisExtent: 230,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        CategoryModel _item = quizProvider.categories[index];
                        return CustomCard(
                          text: _item.name,
                          image: _item.image,
                          onPressed: () => quizProvider.initQuestion(_item.id),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            bottom: 0,
            left: _left,
            right: 0,
            child: Image.asset("assets/icons/shape_bottom.png"),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            top: _topRight,
            right: _topRight,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: textColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 350),
            top: 45,
            right: 15,
            curve: Curves.bounceInOut,
            child: IconButton(
              onPressed: () => Navigation.navigate(routes.SettingRoute),
              icon: Image.asset("assets/icons/icon_settings.png"),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text;
  final String image;
  final Function onPressed;

  const CustomCard({
    Key key,
    this.text,
    this.image,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () {},
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                image ?? "assets/images/poster_onepiece.png",
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            text ?? "Text Title",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: secondaryColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5),
          )
        ],
      ),
    );
  }
}
