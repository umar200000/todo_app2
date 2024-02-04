import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:todo_app2/plans_model_pages/plans_model.dart';

class HiveRepo {
  final Box _box = Hive.box("planList");

  savePlansList(List<PlansModel> list) {
    List<Map<String, dynamic>> plans = [];
    for (var value in list) {
      plans.add(value.toJson());
    }
    _box.put("plans", jsonEncode(plans));
  }

  List<PlansModel> getPlansList() {
    String str = _box.get("plans", defaultValue: "");
    List<PlansModel> list = [];
    if (str.isNotEmpty) {
      List<dynamic> helper = jsonDecode(str);
      for (var plan in helper) {
        list.add(PlansModel.formJson(plan));
      }
    }

    return list;
  }
}
