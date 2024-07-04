import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:responsive_framework/responsive_framework.dart';

String jsonString = '{"header": {"title": "Ensemble donnons vie à vos idées d\'applications !", "subtitle": "Des applications sur mesure qui captivent les utilisateurs grace à la pussance de Flutter."}}';
Map<String, dynamic> jsonData = json.decode(jsonString);

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainSiteState();
}

class _MainSiteState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        title: 'olivier plessis | Freelance Flutter developer',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        builder: (
            BuildContext context,
            Widget? child,
            ) =>
            MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1),
              ),
              child: ResponsiveBreakpoints.builder(
                breakpoints: [
                  const Breakpoint(start: 0, end: 360, name: 'SMALL_MOBILE'),
                  const Breakpoint(start: 361, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
                child: HomeScreen() ?? const SizedBox.shrink(),
              ),
            ),
      ),
    );
  }
}

class MaxSizeConstant {
  static const double maxWidth = 1280;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    String title = jsonData['header']['title'];
    List<String> titleWords = title.split(' ');

    Color ideasColor = Colors.red; // Change color here

    Widget titleWidget = TitleWithColoredText(title: title, ideasColor: ideasColor);


    return Scaffold(
      endDrawer: _drawer(context),
      appBar: _appBar(context),
      body:  Center(
        child: titleWidget,
      ),
    );
  }




  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 32,
      titleTextStyle: Theme.of(context).textTheme.titleSmall?.apply(color: Colors.red),
      scrolledUnderElevation: 4,
      shadowColor: Colors.grey.shade50.withOpacity(0.2),
      title: Center(
    child: MaxWidthBox(
      maxWidth: MaxSizeConstant.maxWidth,
        child: context.isDisplayLargeThanTablet ?  Text('Olivier Plessis', style: Theme.of(context).textTheme.titleLarge?.apply(color: Colors.red)) : Text('pouet'),
      ),
    ),

    );
  }

  Widget? _drawer(BuildContext context) {
    if (context.isDisplayLargeThanTablet) return null;


    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children:  [
          DrawerHeader(
            child: Text('Olivier Plessis'),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () { print('Home'); },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Contact'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}


class TitleWithColoredText extends StatelessWidget {
  final String title;
  final Color ideasColor;

  const TitleWithColoredText({
    required this.title,
    required this.ideasColor,
  });

  @override
  Widget build(BuildContext context) {
    final titleParts = title.split(' ');
    ;
    return RichText(
      text: TextSpan(
        children: [
          for (final part in titleParts)
            TextSpan(
              text: part + ' ',
              style: TextStyle(
                color: !part.contains(titleParts[4]) && !part.contains(titleParts[5]) ? Colors.black : ideasColor,
              ),
            ),
        ],
      ),
    );
  }
}
