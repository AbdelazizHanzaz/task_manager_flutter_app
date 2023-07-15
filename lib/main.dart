import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter_app/data/provider.dart';
import 'package:task_manager_flutter_app/data/services/hive_service.dart';
import 'package:task_manager_flutter_app/routes/app_routes.dart';
import 'package:task_manager_flutter_app/screens/tasks_screen.dart';


void main() async{

 WidgetsFlutterBinding.ensureInitialized();

 final hiveService = HiveService();
 await hiveService.initHive();

  runApp( ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green,),
        useMaterial3: true,
      ),
      //home: const TasksScreen(),
      onGenerateRoute: AppRouters.generateRoute,
      initialRoute: AppRouters.tasks,
    );
  }
}
