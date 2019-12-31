import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';

class Bnb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context);
    return SizedBox.fromSize(
      size: Size.fromHeight(75),
      child: BottomNavigationBar(
        currentIndex: logic.index,
        elevation: 20,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        iconSize: 26,
        onTap: (index) {
          logic.onTap(index);
        },
        backgroundColor: Colors.indigo,
        items: logic.bnbItems
            .map((x) => BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Image.asset(
                  x['icon'],
                  height: 26,
                  width: 26,
                  fit: BoxFit.cover,
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    x['title'],
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                )))
            .toList(),
      ),
    );
  }
}
