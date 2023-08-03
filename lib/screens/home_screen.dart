import 'package:flutter/material.dart';
import 'package:task_manager_flutter_app/screens/widgets/add_update_task_widget.dart';
import '../utils/screen_utils.dart';

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
          //Tasks
          BottomNavigationBarItem(
            icon: Icon(ScreenUtils.getIcon(0)),
            label: ScreenUtils.getTitle(0),
          ),
          //Completed tasks
          BottomNavigationBarItem(
            icon: Icon(ScreenUtils.getIcon(1)),
            label: ScreenUtils.getTitle(1),
          ),
          //Deleted tasks
          BottomNavigationBarItem(
            icon: Icon(ScreenUtils.getIcon(2)),
            label: ScreenUtils.getTitle(2),
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  showDragHandle: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) => const AddUpdateTaskWidget(),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
