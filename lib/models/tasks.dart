class Tasks {
  String content;
  DateTime timeStamp;
  bool done;

  Tasks({
    required this.content,
    required this.timeStamp,
    required this.done,
  });

  factory Tasks.fromMap(Map task) {
    return Tasks(
      content: task["content"],
      timeStamp: task["timeStamp"],
      done: task["done"],
    );
  }

  Map toMap() {
    return {
      "content": content,
      "timeStamp": timeStamp,
      "done": done,
    };
  }
}
