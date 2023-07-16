import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';
import '../widgets/task_form_popup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ScreenUtils.getTitle(_currentIndex)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: ScreenUtils.getScreen(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(ScreenUtils.getIcon(0)),
            label: ScreenUtils.getTitle(0),
          ),
          BottomNavigationBarItem(
            icon: Icon(ScreenUtils.getIcon(1)),
            label: ScreenUtils.getTitle(1),
          ),
          BottomNavigationBarItem(
            icon: Icon(ScreenUtils.getIcon(2)),
            label: ScreenUtils.getTitle(2),
          ),
          // Add other bottom navigation bar items as needed
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => const TaskPopupWidget(),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
