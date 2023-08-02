import 'package:todo_app/feature/todo/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  @override
  int? id;
  @override
  String? title;
  @override
  String? note;
  @override
  int? isCompleted;
  @override
  String? date;
  @override
  String? nameOfDays;
  @override
  String? startTime;
  @override
  String? endTime;
  @override
  int? color;
  @override
  int? remind;
  @override
  String? repeat;

  TaskModel(
      {this.id,
      this.title,
      this.note,
      this.isCompleted,
      this.date,
      this.nameOfDays,
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
            nameOfDays: nameOfDays,
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
      nameOfDays: json['nameOfDays'],
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
    data['nameOfDays'] = nameOfDays;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['remind'] = remind;
    data['repeat'] = repeat;
    data['color'] = color;
    return data;
  }
}
