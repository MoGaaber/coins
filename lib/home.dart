import 'package:flutter/material.dart';
import 'package:usatolebanese/turkesh.dart';
import 'changhmoney.dart';
import 'lebaness.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  color: Colors.red,
                  child: AbsorbPointer(
                    child: Tab(
                      child: Text('العمله التركيه'),
                    ),
                  ),
                ),
                Tab(
                  text: ('محول العملات'),
                ),
              ],
              controller: _tabController,
            ),
          ),
          body: TabBarView(
            children: [Lebaness(), Turkesh(), Changhmoney()],
            controller: _tabController,
          ),
        ),
      ),
    );
  }
}
