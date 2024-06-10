import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:sizer/sizer.dart';
import 'package:stil_duragii/pages/about.dart';
import 'package:stil_duragii/pages/communication.dart';
import 'package:stil_duragii/pages/filter_page.dart';
import 'package:stil_duragii/pages/shopping.dart';
import 'package:stil_duragii/services/get_mongo_data.dart';
import 'package:stil_duragii/widgets/home_pagee_grid_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _advancedDrawerController = AdvancedDrawerController();
  bool _isSearching = false;
  String _searchText = "";
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
        _filterList();
      });
    });
    // İlk başta tüm verileri getir
    _filteredList = List<Map<String, dynamic>>.from(Services.list);
  }

  void _filterList() {
    if (_searchText.isEmpty) {
      setState(() {
        _filteredList = List<Map<String, dynamic>>.from(Services.list);
      });
    } else {
      setState(() {
        _filteredList = Services.list.where((item) {
          return item['urun_adi'].toString().toLowerCase().contains(_searchText.toLowerCase()) ||
                 item['aciklama'].toString().toLowerCase().contains(_searchText.toLowerCase());
        }).cast<Map<String, dynamic>>().toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      animateChildDecoration: true,
      child: Scaffold(
        appBar: AppBar(
          title: _isSearching 
            ? TextField(
              autofocus: true,
                controller: _searchController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Ara...",
                  hintStyle: TextStyle(color: Colors.black ),
                  border: InputBorder.none,
                ),
              )
            : Text("Stil dünyası"),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: IconButton(
                icon: Icon(_isSearching ? Icons.close : Icons.search),
                iconSize: 3.h,
                color: Colors.deepOrange,
                onPressed: () {
                  setState(() {
                    if (_isSearching) {
                      _isSearching = false;
                      _searchController.clear();
                    } else {
                      _isSearching = true;
                    }
                  });
                },
              ),
            )
          ],
          centerTitle: true,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 3.h,),
              Image.asset(
                'images/lg.jpeg',
                height: 9.h,
                width: 9.h,
              ),
              SizedBox(height: 1.h,),
              HomePageGridList(filteredList: _filteredList),
            ],
          ),
        )
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.black,
            iconColor: Colors.black,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'images/lg.jpeg',
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Shopping()));
                  },
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Sepetim'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Communication()));
                  },
                  leading: Icon(Icons.call),
                  title: Text('İletisim'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
                  },
                  leading: Icon(Icons.account_circle),
                  title: Text('Hakkında'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}



