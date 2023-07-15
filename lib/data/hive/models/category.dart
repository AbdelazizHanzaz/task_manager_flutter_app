
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Category extends HiveObject {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;  

  Category({
    required this.id,
    required this.name,
  });

}