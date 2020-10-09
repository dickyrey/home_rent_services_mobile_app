import 'package:flutter/material.dart';
import 'package:home_rent_app/helpers/theme.dart';
import 'package:home_rent_app/providers/theme_provider.dart';
import 'package:home_rent_app/views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context,theme, snapshot) {
          return MaterialApp(
            title: 'Home Rent',
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            darkTheme: darkThemeData(context),
            themeMode: theme.isLightTheme ?  ThemeMode.dark:ThemeMode.light ,
            home: Home(),
          );
        }
      ),
    );
  }
}
