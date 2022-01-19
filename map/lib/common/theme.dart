// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

final appTheme = ThemeData(
  backgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 0, // This removes the shadow from all App Bars.
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF81bbce),
  ),
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.cyan,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 30,
    ),
    headline2: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Color(0xFF81bbce),
    ),
  ),
);
