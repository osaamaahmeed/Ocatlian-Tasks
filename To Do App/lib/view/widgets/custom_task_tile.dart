import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_to_do_app/model/task_model.dart';
import 'package:simple_to_do_app/utils/constant.dart';

class CustomTaskTile extends StatelessWidget {
  const CustomTaskTile({
    super.key,
    required this.task,
    required this.onTap,
    required this.onDismissed,
    required this.onLongPress,
  });

  final TaskModel task;
  final void Function() onTap;
  final VoidCallback onDismissed;
  final void Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.title + task.time.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onDismissed(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white, size: 28),
      ),
      child: InkWell(
        onLongPress: onLongPress,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: task.isComplete ? kMainColor : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                margin: EdgeInsets.only(right: 16, top: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: task.isComplete ? Colors.white : Colors.grey.shade300,
                    width: 2,
                  ),
                  color: task.isComplete
                      ? Colors.white.withValues(alpha: 0.3)
                      : Colors.transparent,
                ),
                child: task.isComplete
                    ? Icon(Icons.check, size: 16, color: Colors.white)
                    : null,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 16,
                        color: task.isComplete ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                        decoration: task.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      task.note,
                      style: TextStyle(
                        fontSize: 14,
                        color: task.isComplete
                            ? Colors.white.withValues(alpha: 0.9)
                            : Colors.grey.shade600,
                        decoration: TextDecoration.none
                      ),
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              DateFormat('hh:mm a').format(task.time),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: task.isComplete ? Colors.white : Colors.grey.shade700,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(task.date),
                              style: TextStyle(
                                fontSize: 11,
                                color: task.isComplete ? Colors.white.withValues(alpha:  0.9) : Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
