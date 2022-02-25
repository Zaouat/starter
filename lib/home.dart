import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('This is App Bar'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Center(
              child: const Text('title').tr(),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Click me')),
            Padding(
              padding: const EdgeInsets.all(16),
              child: DropdownButton<ThemeMode>(
                value: getThemeManager(context).getSelectedTheme().themeMode,
                onChanged: (ThemeMode? theme) =>
                    getThemeManager(context).setThemeMode(theme!),
                items: const [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text('System Theme'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text('Light Theme'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text('Dark Theme'),
                  )
                ],
              ),
            ),
            buildSwitchListTileMenuItem(
                context: context,
                title: "عربي",
                subtitle: "عربي",
                locale: const Locale("ar", "DZ")),
            buildSwitchListTileMenuItem(
                context: context,
                title: "English",
                subtitle: "English",
                locale: const Locale("en", "US")),
          ],
        ));
  }
  Container buildSwitchListTileMenuItem(
      {required BuildContext context, required String title, required String subtitle, required Locale locale}) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
      ),
      child: ListTile(
          dense: true,
          // isThreeLine: true,
          title: Text(
            title,
          ),
          subtitle: Text(
            subtitle,
          ),
          onTap: () {
            log(locale.toString(), name: toString());
            EasyLocalization.of(context)!.setLocale(locale) ;
          }),
    );

  }

}
