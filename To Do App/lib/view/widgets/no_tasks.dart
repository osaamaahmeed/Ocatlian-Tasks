import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoTasks extends StatelessWidget {
  const NoTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/noTasks.svg'),
        Text("You Hvae Done All Tasks!👌", style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }
}