import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  @HiveField(0)
  String title;
  
  @HiveField(1)
  String note;

  @HiveField(2)
  DateTime date;
  
  @HiveField(3)
  DateTime time;
  
  @HiveField(4)
  bool isComplete;
  

  TaskModel({
    required this.title,
    required this.note,
    required this.date,
    required this.time,
    required this.isComplete,
  });
}
