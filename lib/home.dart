import 'package:flutter/material.dart';
import 'package:usatolebanese/turkesh.dart';
import 'changhmoney.dart';
import 'lebaness.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>

  with SingleTickerProviderStateMixin {
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
    return DefaultTabController(

length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text('العمله اللبنانيه'),
                  icon: Icon(Icons.ac_unit),
                ),
                Tab(
                  child: Text('العمله التركيه'),
                  icon: Icon(Icons.ac_unit),
                ),
                Tab(
                  child: Text('محول العملات'),
                  icon: Icon(Icons.ac_unit),
                ),
                
              ],

            controller: _tabController,
          ),
        ),
        body: TabBarView(

          children: [Lebaness(), Turkesh(), Changhmoney()],



          controller: _tabController,),
      ),
    );
  }
}
