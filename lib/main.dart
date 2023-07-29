import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/appcubit/cubit.dart';
import 'package:recipe/dio.dart';
import 'package:recipe/home.dart';
import 'package:recipe/reusable.dart';
import 'package:recipe/test/testcubit.dart';
import 'package:recipe/test/testhome.dart';

void main() {
  DioHelper.init();
  runApp(
     BlocProvider(
       create: (context) => TestCubit(),
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
        home: const HomeTest(),
        theme: ThemeData(
          appBarTheme:   AppBarTheme(
            backgroundColor: defaultColor2,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          textTheme: const TextTheme(
            subtitle1:  TextStyle(
              color: Colors.white,
              fontSize: 25,
            )
          ),
        ),
    ),
     ),
  );
}

