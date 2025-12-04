import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_to_do_app/utils/constant.dart';
import 'package:simple_to_do_app/view/cubits/taskCubit/task_cubit.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        int totalTasks = 0;
        int completedTasks = 0;
        
        if (state is TasksLoaded) {
          totalTasks = state.tasks.length;
          completedTasks = state.tasks.where((t) => t.isComplete).length;
        }

        final double percent = totalTasks == 0 ? 0.0 : completedTasks / totalTasks;
        final int percentDisplay = (percent * 100).round();


        return Row(
          children: [
            const SizedBox(width: 25),
            CircularPercentIndicator(
              radius: 25,
              lineWidth: 4,
              percent: percent.clamp(0, 1),
              center: Text(
                "$percentDisplay",
                style: TextStyle(
                  fontSize: 12,
                  color: kMainColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: Colors.grey,
              progressColor: kMainColor,
            ),
            const SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Tasks",
                    style: TextStyle(
                      fontSize: 40,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "$completedTasks of $totalTasks tasks",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Divider(height: 2, thickness: 1, color: Colors.grey),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
