import 'package:flutter/material.dart';
import 'package:news_app_2/provider/news_provider.dart';
import 'package:news_app_2/screens/category_screen.dart';
import 'package:news_app_2/screens/home_screen.dart';
import 'package:news_app_2/screens/web_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => NewsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.white,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            textTheme: const TextTheme(
              headline6: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
        home: const HomeScreen(),
        routes: {
          CategoryScreen.routeName: (ctx) => const CategoryScreen(),
          WebViewWidget.routeName: (ctx) => const WebViewWidget(),
        },
      ),
    );
  }
}
