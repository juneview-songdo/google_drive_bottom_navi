import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({super.key});

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          //////////////////////
          Container().backgroundColor(Colors.red),
          Container().backgroundColor(Colors.blue),
          Container().backgroundColor(Colors.yellow),
          Container().backgroundColor(Colors.green),
          //////////////////////
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? Icon(
                  Icons.home,
                  size: 25,
                )
                    : Icon(Icons.home_outlined, size: 25),
                label: "Home"),
            BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? Icon(
                  Icons.star,
                  size: 25,
                )
                    : Icon(Icons.star_border_outlined, size: 25),
                label: "Starred"),
            BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? Icon(
                  Icons.supervised_user_circle,
                  size: 25,
                )
                    : Icon(Icons.supervised_user_circle, size: 25),
                label: "Shared"),
            BottomNavigationBarItem(
                icon: _selectedIndex == 3
                    ? Icon(
                  Icons.folder,
                  size: 25,
                )
                    : Icon(Icons.folder_open, size: 25),
                label: "Files"),
          ],
        ),
      ),
    );
  }
}

main() async {
  return buildApp(appHome: NewView());
}
