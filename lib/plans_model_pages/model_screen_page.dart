import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ModelScreenPage extends StatefulWidget {
  final void Function(String str, DateTime dateTime) addPlansToList;

  ModelScreenPage(this.addPlansToList, {super.key});

  @override
  State<ModelScreenPage> createState() => _ModelScreenPageState();
}

class _ModelScreenPageState extends State<ModelScreenPage> {
  DateTime dateTime10 = DateTime.now();
  bool t = false;

  TextEditingController textEditingController = TextEditingController();

  void chooseColendar(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      initialDate: dateTime10,
    ).then((value) {
      if (value != null) {
        setState(() {
          dateTime10 = value;
          t = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom > 0
              ? MediaQuery.of(context).viewInsets.bottom
              : 150,
        ),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                label: Text("Title"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t
                      ? DateFormat("EEEE, d MMMM, yyyy").format(dateTime10)
                      : "Reja kuni tanlanmagan...",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    chooseColendar(context);
                  },
                  child: Text("KUNNI TANLASH"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "BEKOR QILISH",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.isEmpty || !t) return;
                    widget.addPlansToList(
                        textEditingController.text, dateTime10);
                    Navigator.pop(context);
                  },
                  child: Text("KIRTISH"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
