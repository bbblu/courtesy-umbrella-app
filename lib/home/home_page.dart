import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../borrow/borrow_list_page.dart';
import '../map/map_page.dart';
import '../qrcode/qrcode_page.dart';
import '../resources/resources.dart';
import '../user_info/user_info_page.dart';
import '../weather/weather_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    QRCodePage(),
    BorrowListPage(),
    MapPage(),
    WeatherPage(),
    UserInfoPage(),
  ];

  static const List<String> _tiles = [
    '借取雨傘',
    '借傘清單',
    '站點地圖',
    '天氣預報',
    '使用者資訊',
  ];

  static const List<IconData> _icons = [
    FontAwesomeIcons.qrcode,
    Icons.beach_access,
    null,
    FontAwesomeIcons.cloudSun,
    Icons.account_circle,
  ];

  List<Widget> _tapButtons() {
    return List.generate(_icons.length, (index) {
      return index == 2
          ? SizedBox(width: 50.0)
          : IconButton(
              onPressed: () => _onItemTapped(index),
              icon: Icon(_icons[index]),
              iconSize: 18.0,
              color: _selectedIndex == index
                  ? getThemeColor(Colors.black, Colors.white)
                  : Colors.grey,
            );
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            _tiles[_selectedIndex],
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: getThemeColor(Colors.black, Colors.white),
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _pages.elementAt(_selectedIndex),
      floatingActionButton: Ink(
        decoration: BoxDecoration(
          gradient: MyColors.greenGradient,
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () => _onItemTapped(2),
          child: FaIcon(FontAwesomeIcons.mapMarkedAlt,
              color: _selectedIndex == 2
                  ? getThemeColor(Colors.black, Colors.white)
                  : Colors.grey),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: getThemeColor(Colors.white, Colors.black),
        clipBehavior: Clip.antiAlias,
        elevation: 0.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _tapButtons(),
        ),
      ),
    );
  }
}
