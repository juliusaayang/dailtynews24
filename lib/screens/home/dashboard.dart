import 'package:dailynews24/common/colors.dart';
import 'package:dailynews24/screens/home/home.dart';
import 'package:dailynews24/screens/search/search_page.dart';
import 'package:dailynews24/screens/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  static final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  static void navigate(int index) {
    _currentIndex.value = index;
  }

  @override
  void initState() {
    _currentIndex.value = 0;
    super.initState();
  }

  final _widgets = <Widget>[
    const Home(),
    const SearchPage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndex,
      builder: (context, index, child) {
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.9),
          appBar: AppBar(
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                top: 10,
              ),
              child: Image.asset(
                'assets/images/news_log.png',
                height: 70,
                color: AppColors.primary,
              ),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: SafeArea(
            child: _widgets[index],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 5,
            currentIndex: index,
            onTap: (index) {
              navigate(index);
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: BottomNavBarIcon(
                  iconPath: Icons.home,
                  isActive: index == 0,
                ),
                label: 'Home',
                tooltip: 'Home',
              ),
              BottomNavigationBarItem(
                icon: BottomNavBarIcon(
                  iconPath: Icons.search,
                  isActive: index == 1,
                ),
                label: 'Search',
                tooltip: 'Search',
              ),
              BottomNavigationBarItem(
                icon: BottomNavBarIcon(
                  iconPath: Icons.person,
                  isActive: index == 2,
                ),
                label: 'Settings',
                tooltip: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomNavBarIcon extends StatelessWidget {
  final IconData iconPath;
  final bool isActive;
  final Color? color;
  const BottomNavBarIcon({
    Key? key,
    required this.iconPath,
    required this.isActive,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Icon(
        iconPath,
        size: 32,
        color: isActive ? color : const Color(0xff999999),
      ),
    );
  }
}
