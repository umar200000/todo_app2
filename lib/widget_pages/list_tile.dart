import 'package:flutter/material.dart';
import 'package:todo_app2/plans_model_pages/plans_model.dart';

class PlanListTile extends StatelessWidget {
  final PlansModel plansModel;
  final void Function(String id) isDoneFunction;
  final void Function(String id) deletePlan;
  const PlanListTile(this.plansModel, this.isDoneFunction, this.deletePlan, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 4),
      leading: IconButton(
        onPressed: () {
          isDoneFunction(plansModel.id);
        },
        icon: Icon(
          plansModel.isDone
              ? Icons.check_circle_outline
              : Icons.circle_outlined,
          color: plansModel.isDone ? Colors.green : Colors.grey,
        ),
      ),
      title: Text(
        plansModel.planName,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          decoration: plansModel.isDone
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          color: plansModel.isDone ? Colors.grey : Colors.black,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          deletePlan(plansModel.id);
        },
        icon: Icon(Icons.delete_forever),
      ),
    );
  }
}
