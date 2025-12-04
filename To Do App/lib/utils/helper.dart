import 'package:flutter/cupertino.dart';

void showCustomDateTimePicker({required BuildContext context, required DateTime initialDateTime, required CupertinoDatePickerMode mode, required Function(DateTime)onChanged, DateTime? minimumDate}) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.3,
          color: CupertinoColors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    child: Text("Done"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: mode,
                  initialDateTime: initialDateTime,
                  use24hFormat: false,
                  onDateTimeChanged: onChanged,
                  minimumDate: minimumDate,
                ),
              ),
            ],
          ),
        );
      },
    );
  }