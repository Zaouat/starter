import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:starter/utils/font_changer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool rememberMe = false;
  void onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
        } else {}
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'appbar_title'.tr(),
            style: fontChanger(15.sp, FontWeight.bold, context),
          ),
          centerTitle: true,
          elevation: 3,
          toolbarHeight: 10.h,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: Colors.white,
              width: 5,
            ),
            tooltip: 'tooltip_menu'.tr(),
            onPressed: () {
              debugPrint('Menu tapped');
            },
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 4.w, left: 4.w),
              child: ScaleTap(
                onPressed: () {
                  debugPrint('Avatar tapped');
                },
                child: CircleAvatar(
                  radius: 18,
                  child: Image.asset('assets/images/avatar.png'),
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(height: 10.h),

              //-----------Text Widget
              Center(
                child: Text('title'.tr(),
                    style: fontChanger(26.sp, FontWeight.bold, context)),
              ),
              SizedBox(height: 1.h),

              //-----------Button Widget
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: ScaleTap(
                  onPressed: () {},
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('Button tapped');
                    },
                    child: Text('clickMe'.tr(),
                        style: fontChanger(10.sp, FontWeight.w700, context)),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Checkbox(
                value: rememberMe,
                //checkColor: ,
                //fillColor: FlexColor.materialLightPrimary,
                onChanged: (bool? val) => onRememberMeChanged(val!),
              ),

              SizedBox(height: 10.h),

              //-----------DropDown Widget
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: DropdownButton<ThemeMode>(
                  isExpanded: true,
                  elevation: 3,
                  icon: const Icon(Icons.arrow_drop_down),
                  underline: Container(
                    height: 0,
                  ),
                  value: getThemeManager(context).getSelectedTheme().themeMode,
                  onChanged: (ThemeMode? theme) =>
                      getThemeManager(context).setThemeMode(theme!),
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text('system'.tr(),
                          style: fontChanger(10.sp, FontWeight.w500, context)),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('light'.tr(),
                          style: fontChanger(10.sp, FontWeight.w500, context)),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('dark'.tr(),
                          style: fontChanger(10.sp, FontWeight.w500, context)),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              //-----------Language Widget
              buildSwitchListTileMenuItem(
                  context: context,
                  title: "arabic".tr(),
                  locale: const Locale("ar", "DZ")),
              buildSwitchListTileMenuItem(
                  context: context,
                  title: "english".tr(),
                  locale: const Locale("en", "US")),
            ],
          ),
        ));
  }

  Center buildSwitchListTileMenuItem(
      {required BuildContext context,
      required String title,
      required Locale locale}) {
    return Center(
      child: ListTile(
          title: Text(title,
              textAlign: TextAlign.center,
              style: fontChanger(10.sp, FontWeight.w500, context)),
          onTap: () {
            log(locale.toString(), name: toString());
            EasyLocalization.of(context)!.setLocale(locale);
          }),
    );
  }
}
