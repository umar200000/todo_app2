import 'package:flutter/material.dart';
import 'package:todo_app2/plans_model_pages/plans_model.dart';
import 'package:todo_app2/widget_pages/plans_List.dart';

import 'date_time_page.dart';
import 'is_done_plans_page.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  Plans plans = Plans();
  DateTime dateTime = DateTime.now();

  void chooseDateTime(BuildContext context) {
    showDatePicker(
      initialDate: dateTime,
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value != null) {
        setState(() {
          dateTime = value;
        });
      }
    });
  }

  void increaseDay() {
    setState(() {
      dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day + 1);
    });
  }

  void decreaseDay() {
    setState(() {
      dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day - 1);
    });
  }

  void isDonePlan(String id) {
    setState(() {
      plans.plansList
          .firstWhere((element) => element.id == id)
          .isDoneFunction();
    });
  }

  void deletePlan(String id) {
    setState(() {
      plans.plansList.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rejalar Ro'yhati",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          DateTimePage(
            chooseDateTime,
            dateTime,
            increaseDay,
            decreaseDay,
          ),
          SizedBox(
            height: 60,
          ),
          IsDonePlansPage(),
          SizedBox(
            height: 40,
          ),
          PlansList(plans.plansList, isDonePlan, deletePlan),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
