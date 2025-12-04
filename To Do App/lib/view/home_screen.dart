import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_to_do_app/utils/constant.dart';
import 'package:simple_to_do_app/view/add_task_screen.dart';
import 'package:simple_to_do_app/cubits/taskCubit/task_cubit.dart';
import 'package:simple_to_do_app/view/widgets/custom_app_bar.dart';
import 'package:simple_to_do_app/view/widgets/custom_task_tile.dart';
import 'package:simple_to_do_app/view/widgets/home_screen_header.dart';
import 'package:simple_to_do_app/view/widgets/no_tasks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AddTaskScreen()),
              // );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<TaskCubit>(),
                    child: AddTaskScreen(),
                  ),
                ),
              );
            },
            backgroundColor: kMainColor,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              CustomAppBar(),
              HomeScreenHeader(),
              SizedBox(height: 6),
              Expanded(
                child: BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) {
                    if (state is TasksLoaded) {
                      if (state.tasks.isEmpty) {
                        return NoTasks();
                      }
                    }
                    if (state is TasksLoaded) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(6),
                            child: CustomTaskTile(
                              onLongPress: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => AddTaskScreen(editTask: state.tasks[index],),
                                //   ),
                                // );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BlocProvider.value(
                                      value: context.read<TaskCubit>(),
                                      child: AddTaskScreen(editTask: state.tasks[index],),
                                    ),
                                  ),
                                );
                              },
                              task: state.tasks[index],
                              onTap: () {
                                context.read<TaskCubit>().updateTask(
                                  state.tasks[index],
                                );
                              },
                              onDismissed: () {
                                context.read<TaskCubit>().deleteTask(
                                  state.tasks[index],
                                );
                              },
                            ),
                          );
                        },
                        itemCount: state.tasks.length,
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
