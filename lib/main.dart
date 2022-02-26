import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:starter/home.dart';
import 'package:sizer/sizer.dart';
import 'package:starter/utils/constant.dart';

void main() async {
  await ThemeManager.initialise();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'DZ'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const FlexScheme usedScheme = FlexScheme.deepBlue;

    return Sizer(builder: (context, orientation, deviceType) {
      return ThemeBuilder(
        defaultThemeMode: ThemeMode.system,
        darkTheme: FlexThemeData.dark(
          scheme: usedScheme,
          appBarElevation: 3,
        ),
        lightTheme: FlexThemeData.light(
          scheme: usedScheme,
          appBarElevation: 12,
        ),
        builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
          title: Cst.appName,
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: const MyHomePage(),
        ),
      );
    });
  }
}
