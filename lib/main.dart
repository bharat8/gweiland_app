import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gweiland_app/features/home/bloc/home_bloc.dart';
import 'package:gweiland_app/features/home/views/home_screen.dart';
import 'package:gweiland_app/utils/injector/injector.dart';
import 'package:gweiland_app/utils/observers/app_bloc_observers.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await runZonedGuarded(() async {
    Paint.enableDithering = true;

    configureInjector();

    Bloc.observer = AppBlocObserver();

    runApp(const MyApp());
  }, (error, stackTrace) {
    debugPrint(error.toString());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          final data = MediaQuery.of(context);

          return MediaQuery(
            data: data.copyWith(
              textScaleFactor: data.size.width <= 400 ? 0.9 : 1,
            ),
            child: ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(
                context,
                Sizer(
                  builder: (context, orientation, deviceType) {
                    return child!;
                  },
                ),
              ),
              breakpoints: const [
                ResponsiveBreakpoint.resize(350, name: MOBILE),
                ResponsiveBreakpoint.autoScale(600, name: TABLET),
                ResponsiveBreakpoint.resize(
                  800,
                  name: DESKTOP,
                  scaleFactor: 1.4,
                ),
                ResponsiveBreakpoint.autoScale(
                  1700,
                  name: 'XL',
                  scaleFactor: 1.4,
                ),
              ],
            ),
          );
        },
        home: const HomeScreen(),
      ),
    );
  }
}
