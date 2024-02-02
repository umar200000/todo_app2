class PlansModel {
  final String id;
  final String planName;
  final DateTime dateTime;
  bool isDone = false;
  PlansModel(
      {required this.id, required this.dateTime, required this.planName});

  void isDoneFunction() {
    isDone = !isDone;
  }
}

class Plans {
  final List<PlansModel> plansList = [
    PlansModel(
      id: "id1",
      dateTime: DateTime.now(),
      planName: "Bozorga borish",
    ),
    PlansModel(
      id: "id2",
      dateTime: DateTime.now(),
      planName: "Do'stlar bilan ko'rshish",
    ),
    PlansModel(
      id: "id3",
      dateTime: DateTime.now(),
      planName: "ToDo app ni yasash Flutterda",
    ),
  ];
}
