import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_computer/constants/const.dart';
import 'package:time_computer/views/loginScreen.dart';
import 'package:time_computer/views/register_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  PageController _pageController = PageController(
    initialPage: 0
  );

  int _curentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BuildButtonAuth(
                        text: 'دخول',
                        onPressed: (){
                          setState(() {
                            _curentPage = 0;
                            _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeOutQuad);
                          });
                        },
                        colorText: _curentPage == 0? Colors.black : Colors.black38,
                        colorUnderLine: _curentPage == 0? Colors.black : Colors.transparent,
                      ),
                      BuildButtonAuth(
                        text: 'تسجيل',
                        onPressed: (){
                          setState(() {
                            _curentPage = 1;
                            _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeOutQuad);
                          });
                        },
                        colorText: _curentPage == 1? Colors.black : Colors.black38,
                        colorUnderLine: _curentPage == 1? Colors.black : Colors.transparent,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.green,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index){
                          setState(() {
                            _curentPage = index;
                          });
                          // print(_curentPage);
                        },
                        children: [
                          LoginScreen(),
                          RegisterScreen(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Image.asset('assets/images/bootomPage.png'),
            ],
          ),
        )
      ),
    );
  }
}

class BuildButtonAuth extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color colorUnderLine ,colorText;

  const BuildButtonAuth({Key key, this.text, this.onPressed, this.colorUnderLine, this.colorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorUnderLine,width: 5)
        )
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: colorText,
            fontFamily: fontNormal,
            fontSize: 23.0
          ),
        ),
      ),
    );
  }
}
