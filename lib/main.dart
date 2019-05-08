import 'package:flutter/material.dart';
import './home/home_screen.dart';
import './constants.dart' show AppColors;

void main() => runApp(MaterialApp(
  title: '微信',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColors.PrimaryColor),
    cardColor: const Color(AppColors.CardBgColor),
    backgroundColor: Color(AppColors.BackgroundColor),
  ),
  home: HomeScreen(),
));
