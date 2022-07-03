import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/cupertino.dart';

class DatePicker extends StatelessWidget {
  DatePicker({
    Key? key,
    required this.getDate,
  }) : super(key: key);

  Function getDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: CupertinoDatePicker(
        backgroundColor: textColor,
        dateOrder: DatePickerDateOrder.mdy,
        onDateTimeChanged: (DateTime data) {
          getDate(data);
        },
        mode: CupertinoDatePickerMode.date,
        maximumYear: DateTime.now().year,
        maximumDate: DateTime.now(),
      ),
    );
  }
}
