class Task {
  final String title;
  final String body;
  final String date;
  final String time;
  final String category;

  Task(
      {required this.title,
      required this.body,
      required this.date,
      required this.time,
      required this.category});

  Map<String, String> toMap() {
    return {
      "title": title,
      "body": body,
      "date": date,
      "time": time,
      "category": category,
    };
  }

  static Task fromMap(MapEntry task , int index) {
    return Task(
        title: task.value["title"],
        body: task.value["body"],
        date: task.value["date"],
        time: task.value["time"],
        category: task.value["category"]);
  }
}
