import 'package:flutter/material.dart';
import 'package:flutter_projects/src/pages/tab1_page.dart';
import 'package:flutter_projects/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation()
      ),
    );
  }
}

class _Navigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final navigationModel = Provider.of<_NavigationModel>(context);
    
    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (i) => navigationModel.currentPage = i,
      items: const [
        BottomNavigationBarItem(icon: Icon( Icons.person_outline ), label: 'For You'),
        BottomNavigationBarItem(icon: Icon( Icons.public ), label: 'Headlines')
      ],
    );
  }
}


class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget> [

        Tab1Page(),

        Tab2Page(),

      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPage => _currentPage;

  set currentPage( int value ) {
    _currentPage = value;
    
    _pageController.animateToPage(
        value,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut
    );
    
    notifyListeners();
  }

  PageController get pageController => _pageController;
}

