import 'package:todo_app/feature/todo/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;

  TaskModel(
      {this.id,
      this.title,
      this.note,
      this.isCompleted,
      this.date,
      this.startTime,
      this.endTime,
      this.remind,
      this.repeat,
      this.color})
      : super(
            id: id,
            title: title,
            note: note,
            isCompleted: isCompleted,
            date: date,
            startTime: startTime,
            endTime: endTime,
            remind: remind,
            repeat: repeat,
            color: color);
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      note: json['note'],
      isCompleted: json['isCompleted'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      remind: json['remind'],
      repeat: json['repeat'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['note'] = note;
    data['isCompleted'] = isCompleted;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['remind'] = remind;
    data['repeat'] = repeat;
    data['color'] = color;
    return data;
  }
}
