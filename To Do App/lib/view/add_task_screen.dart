import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simple_to_do_app/utils/constant.dart';
import 'package:simple_to_do_app/utils/helper.dart';
import 'package:simple_to_do_app/view/cubits/taskCubit/task_cubit.dart';
import 'package:simple_to_do_app/view/widgets/custom_picker_container.dart';
import 'package:simple_to_do_app/model/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, this.editTask});
  final TaskModel? editTask;
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteConroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.editTask != null) {
      final task = widget.editTask!;
      _titleController.text = task.title;
      _noteConroller.text = task.note;
      _selectedDate = task.date;
      _selectedTime = task.time;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteConroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, size: 40),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      widget.editTask == null ? "Add New Task" : "Edit Task",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                ],
              ),
              const SizedBox(height: 35),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: _titleController,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "What are you planning😇?",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              SizedBox(height: 75),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Divider(thickness: 1, color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Row(
                  children: [
                    Icon(Icons.bookmark_border, color: Colors.grey),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        controller: _noteConroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          hintText: "Add Note",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), // add note ?
              CustomPickerContainer(
                title: "Time",
                value: DateFormat('hh:mm a').format(_selectedTime),
                onTap: () {
                  final now = DateTime.now();
                  bool isToday =
                      _selectedDate.year == now.year &&
                      _selectedDate.month == now.month &&
                      _selectedDate.day == now.day;
                  showCustomDateTimePicker(
                    context: context,
                    initialDateTime: _selectedTime,
                    mode: CupertinoDatePickerMode.time,
                    // minimumDate: isToday ? now : null,
                    onChanged: (newTime) {
                      setState(() {
                        _selectedTime = newTime;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 35),
              CustomPickerContainer(
                title: "Date",
                value: DateFormat.yMMMd().format(_selectedDate),
                onTap: () {
                  showCustomDateTimePicker(
                    // minimumDate: DateTime.now(),
                    context: context,
                    initialDateTime: _selectedDate,
                    mode: CupertinoDatePickerMode.date,
                    onChanged: (newDate) {
                      setState(() {
                        _selectedDate = newDate;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 75),
              GestureDetector(
                onTap: () async {
                  if (widget.editTask == null) {
                    final newTask = TaskModel(
                      title: _titleController.text,
                      note: _noteConroller.text,
                      date: _selectedDate,
                      time: _selectedTime,
                      isComplete: false,
                    );
                    context.read<TaskCubit>().addTask(newTask);
                  } else {
                    final task = widget.editTask!;
                    task
                    ..title = _titleController.text.trim()
                    ..note = _noteConroller.text.trim()
                    ..date = _selectedDate
                    ..time = _selectedTime;
                    await task.save();
                    context.read<TaskCubit>().loadTasks();

                  }
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: kMainColor,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                  child: Text(
                    widget.editTask == null ? "Add Task" : "Update Task",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
