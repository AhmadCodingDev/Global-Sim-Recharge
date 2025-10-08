import 'dart:ui';
import 'package:esim_ui8/router/app_router_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    debugPrint('❌ Flutter Framework Error: ${details.exceptionAsString()}');
    debugPrintStack(stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint('❌ Unhandled Error: $error');
    debugPrint('Stack trace:\n$stack');
    return true;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'Esim UI8',
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'root',
          builder: (context, child) {
            return SafeArea(
              child: child!,
            );
          },
          theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                for (final platform in TargetPlatform.values)
                  platform: const _FadePageTransitionBuilder(),
              },
            ),
          ),
        );
      },
    );
  }
}

class _FadePageTransitionBuilder extends PageTransitionsBuilder {
  const _FadePageTransitionBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return FadeTransition(opacity: animation, child: child);
  }
}
