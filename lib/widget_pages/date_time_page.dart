import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePage extends StatelessWidget {
  final DateTime dateTime;
  final void Function() decreaseDay;
  final void Function() increaseDay;
  final void Function(BuildContext context) chooseDateTime;
  DateTimePage(
      this.chooseDateTime, this.dateTime, this.increaseDay, this.decreaseDay,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            decreaseDay();
          },
          icon: Icon(
            Icons.arrow_left,
            size: 40,
          ),
        ),
        TextButton(
          onPressed: () {
            chooseDateTime(context);
          },
          child: RichText(
            text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: DateFormat("EEEE, ").format(dateTime),
                    style: TextStyle(
                      fontFamily: "Roboto",
                    ),
                  ),
                  TextSpan(
                    text: DateFormat("d MMM").format(dateTime),
                    style: TextStyle(
                      fontFamily: "Montserrat",
                    ),
                  ),
                ]),
          ),
        ),
        IconButton(
          onPressed: () {
            increaseDay();
          },
          icon: Icon(
            Icons.arrow_right,
            size: 40,
          ),
        ),
      ],
    );
  }
}
