import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  Task(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.createAtTime,
      required this.createAtDate,
      required this.isCompleted});

  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String subtitle;

  @HiveField(3)
  DateTime createAtTime;

  @HiveField(4)
  DateTime createAtDate;

  @HiveField(5)
  bool isCompleted;

  factory Task.create({
    required String? title,
    required String? subtitle,
    DateTime? createAtTime,
    DateTime? createAtDate,
  }) =>
      Task(
          id: const Uuid().v1(),
          title: title ?? "",
          subtitle: subtitle ?? "",
          createAtTime: createAtTime ?? DateTime.now(),
          createAtDate: createAtDate ?? DateTime.now(),
          isCompleted: false);
}
