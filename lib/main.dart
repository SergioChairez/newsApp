import 'package:flutter/material.dart';
import 'package:flutter_projects/src/pages/tabs_page.dart';
import 'package:flutter_projects/src/services/news_service.dart';
import 'package:flutter_projects/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        home: const TabsPage(
        ),
      ),
    );
  }
}
