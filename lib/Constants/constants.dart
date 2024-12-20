import 'package:flutter/material.dart';

class Constants {
  // builder
  final String homePageAppBarText;
  final TextStyle appbarTexts;
  final Color homePageAppBar;
  final Color detayPageAppBar;

  Constants._builder(ConstantsBuilder builder)
      : homePageAppBarText = builder._homePageAppBarText,
        appbarTexts = builder._appbarTexts,
        homePageAppBar = builder._homePageAppBar,
        detayPageAppBar = builder._detayPageAppBar;

  static ConstantsBuilder get builder => ConstantsBuilder();
}

class ConstantsBuilder {
  String _homePageAppBarText = "";
  TextStyle _appbarTexts = TextStyle();
  Color _homePageAppBar = Colors.transparent;
  Color _detayPageAppBar = Colors.transparent;

  ConstantsBuilder homePageAppBarText(String text) {
    _homePageAppBarText = text;
    return this;
  }

  ConstantsBuilder appbarTexts(TextStyle style) {
    _appbarTexts = style;
    return this;
  }

  ConstantsBuilder homePageAppBar(Color color) {
    _homePageAppBar = color;
    return this;
  }

  ConstantsBuilder detayPageAppBar(Color color) {
    _detayPageAppBar = color;
    return this;
  }

  Constants build() {
    return Constants._builder(this);
  }
}
