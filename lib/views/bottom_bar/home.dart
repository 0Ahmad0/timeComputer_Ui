import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_computer/constants/const.dart';
import 'package:time_computer/models/section.dart';

import '../loginScreen.dart';

class Home extends StatelessWidget {
  List<String> _images = [
    'assets/images/mobiles.png',
    'assets/images/laptops.png',
    'assets/images/pcs.png',
    'assets/images/laptops.png',
    'assets/images/pcs.png',
  ];
  List<String> _title = [
    'Huawei 2021 9pro',
    'Asus 2021 Rog',
    'Lenovo PL30',
    'Pc Gamming Dl902',
    'Pro 2019 Max',
  ];
  List<String> _price = [
    '400\$',
    '2500\$',
    '2000\$',
    '3000\$',
    '900\$',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 15.0),
                child: Image.asset('assets/images/logo1.png'),
              ),
              Container(
                alignment: Alignment.center,
                width: 220.0,
                height: 45.0,
                decoration: BoxDecoration(
                  color: Color(0xffebeaea),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: primaryColor,
                      ),
                      border: InputBorder.none,
                      hintText: 'ابحث هنا',
                      hintStyle: TextStyle(
                          fontSize: 22.0,
                          fontFamily: fontNormal,
                          color: primaryColor),
                      hintTextDirection: TextDirection.rtl),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_left,
                      size: 30,
                    ),
                    Text(
                      'الكل',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: fontNormal,
                          color: primaryColor),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CreateButton(
                  text: 'الأكثر مبيعا',
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            width: double.infinity,
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (ctx, index) {
                return Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  width: 180,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: primaryColor, width: 1.8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _title[index],
                            textAlign: TextAlign.center,
                          ),
                          Image.asset(
                            _images[index],
                            width: 100,
                            height: 60,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        height: 80.0,
                        width: 3.0,
                        color: primaryColor,
                      ),
                      Flexible(child: Text(_price[index]))
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            height: 10.0,
            width: 300,
            child: Divider(
              thickness: 1.3,
              color: primaryColor,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CreateButton(
                  text: 'الأقسام',
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 20
              ),
              itemCount: 4,
              itemBuilder: (ctx, index) {
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: sections[index].color
                  ),
                  child: Column(
                    children: [
                      Image.asset(sections[index].image,width: 100,height: 100,),
                      Text(sections[index].text,style: TextStyle(
                        fontFamily: fontNormal,
                        color: Colors.white,
                        fontSize: 20.0
                      ),)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
