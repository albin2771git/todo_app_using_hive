import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_using_hive/models/task.dart';
import 'package:todo_app_using_hive/utils/colors.dart';
import 'package:todo_app_using_hive/view/tasks/task_view.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key, required this.task});
  final Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  TextEditingController taskControllerForTitle = TextEditingController();
  TextEditingController taskControllerForSubtitle = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    taskControllerForSubtitle.text = widget.task.title;
    taskControllerForSubtitle.text = widget.task.subtitle;
    super.initState();
  }

  @override
  void dispose() {
    taskControllerForTitle.dispose();
    taskControllerForSubtitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskView(
                      taskControllerForTitle: taskControllerForTitle,
                      taskControllerForSubtitle: taskControllerForSubtitle,
                      task: widget.task)));
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: widget.task.isCompleted
                  ? Color.fromARGB(154, 119, 144, 229)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    offset: Offset(0, 4),
                    blurRadius: 10)
              ]),
          child: ListTile(
            leading: GestureDetector(
                onTap: () {
                  widget.task.isCompleted = !widget.task.isCompleted;
                  widget.task.save();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  decoration: BoxDecoration(
                      color: widget.task.isCompleted
                          ? MyColors.primaryColor
                          : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: .8)),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                )),
            title: Padding(
              padding: EdgeInsets.only(bottom: 5, top: 3),
              child: Text(
                taskControllerForTitle.text,
                style: TextStyle(
                  color: widget.task.isCompleted
                      ? MyColors.primaryColor
                      : Colors.black,
                  fontWeight: FontWeight.w500,
                  decoration: widget.task.isCompleted
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taskControllerForSubtitle.text,
                    style: TextStyle(
                        color: widget.task.isCompleted
                            ? MyColors.primaryColor
                            : Color.fromARGB(255, 164, 164, 164),
                        fontWeight: FontWeight.w300,
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : null)),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('hh:mm a')
                              .format(widget.task.createAtTime),
                          style: TextStyle(
                              fontSize: 14,
                              color: widget.task.isCompleted
                                  ? Colors.white
                                  : Colors.grey),
                        ),
                        Text(
                          DateFormat.yMMMEd().format(widget.task.createAtDate),
                          style: TextStyle(
                              fontSize: 12,
                              color: widget.task.isCompleted
                                  ? Colors.white
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
