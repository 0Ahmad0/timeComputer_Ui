import 'package:flutter/material.dart';
import 'package:time_computer/constants/const.dart';

import 'bottom_bar/bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String name, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 80,),
                InputTextFiled(
                  hintText: 'اسم المستخدم',
                  icon: Icons.account_circle_outlined,
                  onChange: (val) {
                    name = val;
                    // print(name);
                  },
                  validator: (String val) {
                    if (val.isEmpty || val.length < 5) {
                      return 'يرجى كتابة الاسم';
                    } else {
                      return null;
                    }
                  },
                ),
                InputTextFiled(
                  obscure: true,
                  hintText: 'كلمة المرور',
                  icon: Icons.lock_open_rounded,
                  onChange: (val) {
                    password = val;
                    // print(name);
                  },
                  validator: (String val) {
                    if (val.isEmpty) {
                      return 'يرجى كتابة كلمة المرور';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                CreateButton(
                  text: 'دخول',
                  onPressed: () {
                    if (_key.currentState.validate()) {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>BottomBarScreen()));
                    } else {
                    }
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'أو',
                  style: TextStyle(fontSize: 30.0, fontFamily: fontBold),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CreateSoialButton(
                      images: 'assets/images/twiter.png',
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 35.0,
                    ),
                    CreateSoialButton(
                      images: 'assets/images/google+.png',
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 35.0,
                    ),
                    CreateSoialButton(
                      images: 'assets/images/facebook.png',
                      onTap: () {},
                    ),
                  ],
                ),

              ],
            ),
          ),
        ));
  }
}

class CreateSoialButton extends StatelessWidget {
  final String images;
  final Function onTap;

  const CreateSoialButton({Key key, this.images, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(images))),
      ),
    );
  }
}

class CreateButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CreateButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.9,
      height: 60,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(100.0)),
      child: FlatButton(
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: fontBold, fontSize: 22.0),
        ),
      ),
    );
  }
}

class InputTextFiled extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Function onChange, validator;
  final bool obscure;

  const InputTextFiled(
      {Key key, this.hintText, this.icon, this.onChange, this.validator, this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 80,
        child: TextFormField(
          autofocus: true,
          textInputAction: TextInputAction.next,
          obscureText: obscure,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              size: 30.0,
              color: primaryColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide(
                color: primaryColor
              )
            ),
            hintTextDirection: TextDirection.rtl,
            hintText: hintText,
            hintStyle: textStyleInputFiled,
          ),
          onChanged: onChange,
          validator: validator,
        ),
      ),
    );
  }
}
