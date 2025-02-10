import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_flutter_app/pages/home_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text('Page 2'),
    Text('Page 3'),
    Text('Page 4'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    const Color selectedItemColor = Color(0xff00B761);
    const Color unSelectedItemColor = Color(0xffB2B2B2);
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 10),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                colorFilter: ColorFilter.mode(_selectedIndex == 1 ? selectedItemColor : unSelectedItemColor, BlendMode.srcIn),
              ),
              label: ''
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  colorFilter: ColorFilter.mode(_selectedIndex == 2 ? selectedItemColor : unSelectedItemColor, BlendMode.srcIn),
                ),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  colorFilter: ColorFilter.mode(_selectedIndex == 3 ? selectedItemColor : unSelectedItemColor, BlendMode.srcIn),
                ),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  colorFilter: ColorFilter.mode(_selectedIndex == 4 ? selectedItemColor : unSelectedItemColor, BlendMode.srcIn),
                ),
                label: ''
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

