import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_to_do_app/utils/constant.dart';
import 'package:simple_to_do_app/view/cubits/taskCubit/task_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          SizedBox(width: 25),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.nightlight_sharp, color: kMainColor, size: 32),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              context.read<TaskCubit>().deleteAllTasks();  
            },
            icon: Icon(Icons.delete_outline, color: kMainColor, size: 32),
          ),
          SizedBox(width: 25),
        ],
      ),
    );
  }
}
