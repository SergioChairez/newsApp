import 'package:flutter/material.dart';
import 'package:flutter_projects/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

import '../services/news_service.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(
      body: NewsList(headlines)
      );
  }
}
