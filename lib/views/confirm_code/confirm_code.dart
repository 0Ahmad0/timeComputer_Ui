import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_computer/constants/const.dart';
import 'package:time_computer/views/success_Register.dart';

import 'input_code_row_widget.dart';

typedef OnValueChanged = void Function(String value);
typedef OnComplete = void Function(String value);

class ConfirmCodeRegister extends StatefulWidget {
  final OnValueChanged onValueChanged;
  final OnComplete onComplete;

  const ConfirmCodeRegister({Key key, this.onValueChanged, this.onComplete})
      : super(key: key);

  @override
  _ConfirmCodeRegisterState createState() => _ConfirmCodeRegisterState();
}

class _ConfirmCodeRegisterState extends State<ConfirmCodeRegister> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  String _inputCode = "";
  int _temp = 0;

  @override
  void initState() {
    super.initState();
    _controller.text = "";
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      // auto focus
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded, color: primaryColor,size: 30,),
        ),
      ),
      body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset('assets/images/bootomPage.png'),
              Center(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'برجاء إدخال الكود المرسل \nإلى رقم الموبل\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: fontNormal,
                    fontSize: 22.0,
                    height: 1.5
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      InputRowWidget(
                        inputCode: _inputCode,
                      ),
                      Opacity(
                        opacity: 0.0,
                        child: TextField(
                          style: TextStyle(color: Colors.transparent, fontSize: 0),
                          // only digits
                          inputFormatters: [
                            WhitelistingTextInputFormatter(RegExp(r"[0-9]"))
                          ],
                          keyboardType: TextInputType.number,
                          focusNode: _focusNode,
                          controller: _controller,
                          maxLength: 6,
                          onChanged: (String value) {
                            _inputCode = _controller.text;

                            if (widget.onValueChanged != null) {
                              widget.onValueChanged(_inputCode);
                            }

                            if (_inputCode.length < 4) {
                              _temp = 0;
                            } else if (_inputCode.length == 4) {
                              // dismiss the keyboard
                              _focusNode.unfocus();
                              _temp++;
                              if (_temp == 1) {
                                //********************************************//
                                print('verificationCode---' + _inputCode);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => SuccessRegister()));
                                //*******************************************//
                                if (widget.onComplete != null) {
                                  widget.onComplete(_inputCode);
                                }
                              }
                            }
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: fontNormal,
                      fontSize: 22.0,
                      height: 2
                    ),
                    children: [
                      TextSpan(
                        text: 'في حالة عدم استقبال الكود  \n  خلال 60 ثانية اضغط '
                      ),
                      TextSpan(
                        text: 'هنا',
                        style: TextStyle(
                          color: Color(0xffffc403),
                          decoration: TextDecoration.underline,
                        )
                      ),
                    ]
                  )
                ),
              ],
        ),
      ),
            ],
          )),
    );
  }
}
