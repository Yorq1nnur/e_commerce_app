import 'package:e_commerce_app/screens/tabs/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../view_models/tab_view_model.dart';
import 'book/books_screen.dart';
import 'categories/categories_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> screens = const [
    CategoriesScreen(),
    BooksScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[context.watch<TabViewModel>().getIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<TabViewModel>().getIndex,
        onTap: (newIndex) {
          context.read<TabViewModel>().changeIndex(newIndex);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              color: Colors.black,
              size: 20.w,
            ),
            label: "Categories",
            activeIcon: Icon(
              Icons.category,
              color: Colors.blue,
              size: 30.w,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: Colors.black,
              size: 20.w,
            ),
            label: "Books",
            activeIcon: Icon(
              Icons.book,
              color: Colors.blue,
              size: 30.w,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
              size: 20.w,
            ),
            label: "Settings",
            activeIcon: Icon(
              Icons.settings,
              color: Colors.blue,
              size: 30.w,
            ),
          ),
        ],
      ),
    );
  }
}
