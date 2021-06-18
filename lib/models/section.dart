import 'package:flutter/material.dart';

class Section {
  String image, text;
  Color color;

  Section({this.color, this.image, this.text});
}

List<Section> sections = [
  Section(
      color: Color(0xff656ee6),
      image: 'assets/images/pcs.png',
      text: 'أجهزة كمبيوتر'),
  Section(
      color: Color(0xff2986ff),
      image: 'assets/images/laptops.png',
      text: 'لاب توب'),
  Section(
      color: Color(0xffff3333),
      image: 'assets/images/mobiles.png',
      text: 'موبايل'),
  Section(
      color: Color(0xff65e66e),
      image: 'assets/images/settings.png',
      text: 'طلبات صيانة'),

];
