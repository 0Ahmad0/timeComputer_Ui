import 'package:flutter/material.dart';
import 'package:time_computer/constants/const.dart';
import 'package:time_computer/views/confirm_code/confirm_code.dart';
import 'package:time_computer/views/success_Register.dart';

import 'loginScreen.dart';

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String name , password , confrimPassword, email, phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40,),
                InputTextFiled(
                  hintText: 'اسم المستخدم',
                  icon: Icons.account_circle_outlined,
                  onChange: (val){
                    name = val;
                    // print(name);
                  },
                  validator: (String val){
                    if(val.isEmpty || val.length < 5){
                      return 'يرجى كتابة الاسم';
                    }else{
                      return null;
                    }
                  },
                ),
                InputTextFiled(
                  obscure: true,
                  hintText: 'كلمة المرور',
                  icon: Icons.lock_open_rounded,
                  onChange: (val){
                    password = val;
                    // print(name);
                  },
                  validator: (String val){
                    if(val.isEmpty){
                      return 'يرجى كتابة كلمة المرور';
                    }else{
                      return null;
                    }
                  },
                ),
                InputTextFiled(
                  hintText: 'تأكيد كلمة المرور',
                  icon: Icons.lock_open_rounded,
                  onChange: (val){
                    confrimPassword = val;
                    // print(name);
                  },
                  obscure: true,
                  validator: (String val){
                    if(val.isEmpty || (val != password)){
                      return 'يرجى كتابة كلمة المرور نفسها';
                    }else{
                      return null;
                    }
                  },
                ),
                InputTextFiled(
                  hintText: 'البريد الإلكتروني',
                  icon: Icons.email_outlined,
                  onChange: (val){
                    confrimPassword = val;
                    // print(name);
                  },
                  validator: (String val){
                    if(val.isEmpty || !val.contains('@')){
                      return 'يرجى كتابة بريد صالح';
                    }else{
                      return null;
                    }
                  },
                ),
                InputTextFiled(
                  hintText: 'رقم الهاتف',
                  icon: Icons.phone_android_outlined,
                  onChange: (val){
                    confrimPassword = val;
                    // print(name);
                  },
                  validator: (String val){
                    if(val.isEmpty || val.length < 9){
                      return 'يرجى كتابة رقم صالح';
                    }else{
                      return null;
                    }
                  },
                ),
                CreateButton(
                  text: 'تسجيل',
                  onPressed: (){
                    if(_key.currentState.validate()){
                     Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ConfirmCodeRegister()));
                    }else{

                    }
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}
