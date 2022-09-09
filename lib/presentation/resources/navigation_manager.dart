import 'package:flutter/material.dart';
import '../main/home_screen.dart';

void onbording(context) => Navigator.pushAndRemoveUntil(
    (context),
    MaterialPageRoute(builder: (context) => const HomeScreen()),
    (route) => false);
