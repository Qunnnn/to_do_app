import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constant/app_colors.dart';
import 'package:todo_app/constant/app_textStyle.dart';
import 'package:todo_app/core/layout/app_layout.dart';
import 'package:todo_app/feature/todo/data/model/task_model.dart';
import 'package:todo_app/feature/todo/presentation/provider/provider.dart';
import '../widgets/widgets.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  late TaskProvider taskProvider;
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  DateTime _selectDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = const TimeOfDay(hour: 22, minute: 00);
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monhtly'];
  int selectedColor = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      taskProvider = Provider.of<TaskProvider>(context, listen: false);
    });
    print(_selectDate);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(),
      ),
      body: Container(
        margin:
            EdgeInsets.all(AppLayout.getHeight(context: context, pixel: 15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Task',
              style: AppTextStyle.headingStyle,
            ),
            SizedBox(
              height: AppLayout.getHeight(context: context, pixel: 10),
            ),
            MyTextFormFiled(
              subTitle: 'Title',
              hint: 'Enter title here.',
              controller: titleController,
              expand: false,
              maxLines: 1,
            ),
            SizedBox(
              height: AppLayout.getHeight(context: context, pixel: 10),
            ),
            MyTextFormFiled(
              subTitle: 'Note',
              hint: 'Enter Note here.',
              controller: noteController,
              expand: true,
            ),
            SizedBox(
              height: AppLayout.getHeight(context: context, pixel: 10),
            ),
            MyTextFormFiled(
                subTitle: 'Date',
                hint: DateFormat.yMd().format(_selectDate),
                widget: IconButton(
                    onPressed: () {
                      _getDate(context);
                    },
                    icon: const Icon(Icons.calendar_today_outlined))),
            SizedBox(
              height: AppLayout.getHeight(context: context, pixel: 10),
            ),
            Row(
              children: [
                Expanded(
                  child: MyTextFormFiled(
                    subTitle: 'Start Time',
                    hint: DateFormat("hh:mm a")
                        .format(DateTime(
                            _selectDate.year,
                            _selectDate.month,
                            _selectDate.day,
                            _startTime.hour,
                            _startTime.minute))
                        .toString(),
                    widget: IconButton(
                        onPressed: () {
                          _getTime(isStartTime: true);
                        },
                        icon: const Icon(Icons.access_time_rounded)),
                  ),
                ),
                SizedBox(
                  width: AppLayout.getWidth(context: context, pixel: 10),
                ),
                Expanded(
                  child: MyTextFormFiled(
                    subTitle: 'End Time',
                    hint: DateFormat("hh:mm a")
                        .format(DateTime(_selectDate.year, _selectDate.month,
                            _selectDate.day, _endTime.hour, _endTime.minute))
                        .toString(),
                    widget: IconButton(
                        onPressed: () {
                          _getTime(isStartTime: false);
                        },
                        icon: const Icon(Icons.access_time_rounded)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppLayout.getHeight(context: context, pixel: 10),
            ),
            MyTextFormFiled(
              subTitle: 'Remind',
              hint: '$_selectedRemind minutes early',
              widget: DropdownButton<String>(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).iconTheme.color,
                ),
                underline: Container(height: 0),
                items: remindList.map<DropdownMenuItem<String>>((int value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(
                      value.toString(),
                      style: AppTextStyle.contentStyle.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedRemind = int.parse(value!);
                  });
                },
              ),
            ),
            MyTextFormFiled(
              subTitle: 'Repeat',
              hint: _selectedRepeat,
              widget: DropdownButton<String>(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).iconTheme.color,
                ),
                underline: Container(height: 0),
                items: repeatList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: AppTextStyle.contentStyle
                          .copyWith(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedRepeat = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: AppLayout.getHeight(context: context, pixel: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                colorPalette(context),
                InkWell(
                  onTap: () {
                    _validate();
                  },
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Builder(builder: (context) {
                    final themeMode = context.read<ThemeService>();
                    return MyButton(
                      themeMode: themeMode,
                      title: 'Create Task',
                    );
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _validate() {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      //add to database

      _addTaskToDB();
      taskProvider.getTasks();
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Enter your title or note field!',
        style: AppTextStyle.contentStyle,
      )));
    }
  }

  _addTaskToDB() async {
    await taskProvider.insert(
        task: TaskModel(
      title: titleController.text,
      note: noteController.text,
      date: _selectDate.toString(),
      startTime: DateFormat("hh:mm a")
          .format(DateTime(_selectDate.year, _selectDate.month, _selectDate.day,
              _startTime.hour, _startTime.minute))
          .toString(),
      endTime: DateFormat("hh:mm a")
          .format(DateTime(_selectDate.year, _selectDate.month, _selectDate.day,
              _endTime.hour, _endTime.minute))
          .toString(),
      remind: _selectedRemind,
      repeat: _selectedRepeat,
      color: selectedColor,
      isCompleted: 0,
    ));
  }

  Column colorPalette(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: AppTextStyle.subHeadingStyle,
        ),
        Wrap(
          children: List.generate(
              3,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: index == 0
                            ? AppColors.blueAccentColor
                            : index == 1
                                ? AppColors.redColor
                                : AppColors.yellowColor,
                        child: selectedColor == index
                            ? Icon(
                                Icons.done,
                                color: Theme.of(context).iconTheme.color,
                              )
                            : const SizedBox(),
                      ),
                    ),
                  )).toList(),
        )
      ],
    );
  }

  _getDate(BuildContext context) async {
    DateTime? getDatePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (getDatePicker != null) {
      setState(() {
        _selectDate = getDatePicker;
      });
    }
  }

  _getTime({required bool isStartTime}) async {
    TimeOfDay? getTimePicker = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: false,
          ),
          child: child!,
        );
      },
    );
    if (getTimePicker != null) {
      if (isStartTime) {
        setState(() {
          _startTime = getTimePicker;
        });
      } else {
        setState(() {
          _endTime = getTimePicker;
        });
      }
    }
  }
}
