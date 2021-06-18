import 'package:flutter/material.dart';
import 'package:time_computer/constants/const.dart';
import 'package:time_computer/views/loginScreen.dart';

import 'bottom_bar/bottom_bar.dart';

class SuccessRegister extends StatelessWidget {
  const SuccessRegister({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset('assets/images/bootomPage.png'),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 110,
                child: Icon(Icons.done,size: 210,color: Colors.white,),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'مبروك\n أنت دلوقتي عميل\n تايم كمبيوتر',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: fontNormal,
                  color: primaryColor,
                  height: 1.4
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 25.0,
              ),
              CreateButton(
                text: 'القائمة الرئيسية',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>BottomBarScreen()));
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
