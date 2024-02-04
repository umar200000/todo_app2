import 'package:todo_app2/plans_model_pages/hive_repo.dart';

class PlansModel {
  final String id;
  final String planName;
  final DateTime dateTime;
  bool isDone = false;
  PlansModel({
    required this.id,
    required this.dateTime,
    required this.planName,
    this.isDone = false,
  });

  void isDoneFunction() {
    isDone = !isDone;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "planName": planName,
      "dateTime": dateTime.millisecondsSinceEpoch,
      "isDone": isDone,
    };
  }

  factory PlansModel.formJson(Map<String, dynamic> data) {
    return PlansModel(
      id: data["id"],
      dateTime: DateTime.fromMillisecondsSinceEpoch(data["dateTime"]),
      planName: data["planName"],
      isDone: data["isDone"],
    );
  }
}

class Plans {
  final List<PlansModel> plansList = HiveRepo().getPlansList();

  void addPlans(String planName, DateTime dateTime) {
    plansList.add(
      PlansModel(
        id: "id${plansList.length + 1}",
        dateTime: dateTime,
        planName: planName,
      ),
    );
    HiveRepo().savePlansList(plansList);
  }

  List<PlansModel> getListByTime(DateTime dateTime) {
    return plansList
        .where((element) =>
            element.dateTime.day == dateTime.day &&
            element.dateTime.month == dateTime.month &&
            element.dateTime.year == dateTime.year)
        .toList();
  }
}

// [
// // PlansModel(
// //   id: "id1",
// //   dateTime: DateTime.now(),
// //   planName: "Bozorga borish",
// // ),
// // PlansModel(
// //   id: "id2",
// //   dateTime: DateTime.now(),
// //   planName: "Do'stlar bilan ko'rshish",
// // ),
// // PlansModel(
// //   id: "id3",
// //   dateTime: DateTime.now(),
// //   planName: "aa",
// // ),
// ];
