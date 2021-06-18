import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_computer/constants/const.dart';
import 'package:time_computer/views/splash_screen.dart';

class OnBordingScreen extends StatefulWidget {
  @override
  _OnBordingScreenState createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  final _numPages = 2;
  final PageController _pageController = PageController(initialPage: 1);
  int _currentPage = 1;

  List<Widget> _buildCircularIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 14.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isActive ? primaryColor : Color(0xff949ba2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    height: 50,
                    alignment: Alignment.centerRight,
                    child: _currentPage == _numPages - 1
                        ? FlatButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => SplashScreen())),
                            child: Text('تخطي',style: TextStyle(
                              fontFamily: fontNormal,
                              fontSize: 20.0,
                              height: 2
                            ),),
                          )
                        : null),
                SizedBox(
                  height: 500,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      ScreenOnBord(
                        image: 'assets/images/Asset 2.png',
                        title: 'أطلب صيانتك',
                        caption: 'مركز خدمة متكامل وصيانة\nمنزلية للاب توب',
                      ),
                      ScreenOnBord(
                        image: 'assets/images/Asset 1.png',
                        title: 'منحقق المعادلة الصعبة',
                        caption:
                            'إمكانيات مناسبة لكل الفئات\nمع سعر في المتناول',
                      ),

                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildCircularIndicator()),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: primaryColor),
                  child: FlatButton(
                    textColor: Colors.white,
                    onPressed: () {
                      _currentPage == _numPages - 1
                          ? _pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease)
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => SplashScreen()));
                    },
                    child: Text(
                        _currentPage == _numPages - 1 ? 'التالي' : 'بدء الآن',style: TextStyle(
                        fontFamily: fontBold,
                        fontSize: 30.0,
                    ),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenOnBord extends StatelessWidget {
  final String image, title, caption;

  const ScreenOnBord({Key key, this.image, this.title, this.caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Image.asset(image),
        ),
        Column(
          children: [
            Text(
              title,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  fontFamily: fontBold,
                  height: 2),
            ),
            Text(
              caption,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: fontNormal,
                fontSize: 23,
              ),
            ),
          ],
        )
      ],
    );
  }
}
