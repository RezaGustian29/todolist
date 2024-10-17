import 'package:flutter/material.dart';
import 'package:todolist/config/theme.dart';
import 'package:todolist/view/auth/login_view.dart';
import 'package:todolist/view/home/home_view.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;
  int selectedIndex = 0;
  int currentPageIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      currentPageIndex = index; // Update currentPageIndex here
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleTextColor,
        child: Icon(
          Icons.add,
          color: primaryTextColor,
        ),
      );
    }

    return Scaffold(
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black, // <-- This works for fixed

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(left: 28),
              child: Image.asset(
                'assets/icons/index.png',
                width: 55,
                color: selectedIndex == 0 ? Colors.red : Colors.white,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/icons/calendar.png',
                width: 55,
                color: selectedIndex == 1 ? Colors.red : Colors.white,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Image.asset(
                'assets/icons/focuse.png',
                width: 55,
                color: selectedIndex == 2 ? Colors.red : Colors.white,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/icons/profile.png',
                width: 55,
                color: selectedIndex == 3 ? Colors.red : Colors.white,
              ),
            ),
            label: '',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
      body: <Widget>[
        const HomeView(),
        const LoginView(),
        const HomeView(),
        const LoginView(),
      ][currentPageIndex],
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todolist/config/theme.dart';
import 'package:todolist/provider/page_provider.dart';
import 'package:todolist/view/auth/login_view.dart';
import 'package:todolist/view/home/home_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //int currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleTextColor,
        child: Icon(
          Icons.add,
          color: primaryTextColor,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: contentColor,
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            //backgroundColor: Colors.pink,
            elevation: 0,
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              pageProvider.currentIndex = value;
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                /*  backgroundColor: Colors.amber,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 2.5,
                    right: 10,
                  ),
                  child: Image.asset(
                    'assets/icons/icons_univ.png',
                    width: 20,
                    color: pageProvider.currentIndex == 0
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ), */
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Home',
                /* backgroundColor: Colors.red,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 2.5,
                    right: 50,
                  ),
                  child: Image.asset(
                    'assets/icons/icons_univ.png',
                    width: 20,
                    color: pageProvider.currentIndex == 1
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '', */
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                /* backgroundColor: contentColor,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 2.5,
                    left: 30,
                  ),
                  child: Image.asset(
                    'assets/icons/icons_univ.png',
                    width: 20,
                    color: pageProvider.currentIndex == 2
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '', */
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                /*  backgroundColor: contentColor,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 2.5,
                  ),
                  child: Image.asset(
                    'assets/icons/icons_univ.png',
                    width: 15,
                    color: pageProvider.currentIndex == 3
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '', */
              ),
            ],
          ),
        ),
      );
    }

    Widget? body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return const HomeView();
        case 1:
          return const LoginView();
        case 2:
          return const HomeView();
        case 3:
          return const LoginView();
        default:
          return null;
      }
    }

    return Scaffold(
      backgroundColor:
          pageProvider.currentIndex == 0 ? contentColor : Colors.amber,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: SafeArea(child: body()!),
    );
  }
} */
