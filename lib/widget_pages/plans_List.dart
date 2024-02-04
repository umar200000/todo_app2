import 'package:flutter/material.dart';
import 'package:todo_app2/widget_pages/list_tile.dart';

import '../plans_model_pages/plans_model.dart';

class PlansList extends StatelessWidget {
  final List<PlansModel> list;
  final void Function(String id) isDoneFunction;
  final void Function(String id) deletePlan;
  PlansList(this.list, this.isDoneFunction, this.deletePlan, {super.key});

  @override
  Widget build(BuildContext context) {
    return list.length > 0
        ? Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return PlanListTile(
                  list[index],
                  isDoneFunction,
                  deletePlan,
                );
              },
              itemCount: list.length,
            ),
          )
        : Column(
            children: [
              Text(
                "Hozircha rejalar yo'q!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/sleep.png",
                height: 220,
              ),
            ],
          );
  }
}
