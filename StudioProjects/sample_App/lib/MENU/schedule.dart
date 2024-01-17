import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(ScheduleApp());
}

class ScheduleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScheduleScreen(),
    );
  }
}

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime selectedDate = DateTime.now();
  List<String> availableTimeSlots = [
    '9:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '11:00 AM - 12:00 PM',
    // 他の時間帯を追加
  ];

  void onDateSelected(DateTime date) {
    // 日付が選択されたときに、予約可能な時間帯を更新するロジックをここに追加
    // このサンプルでは固定のリストを使用しています
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('スタジオスケジュール'),
      ),
      body: Column(
        children: <Widget>[
          TableCalendar(
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(Duration(days: 365)),
            focusedDay: selectedDate,
            onDaySelected: (date, focusedDate) {
              onDateSelected(date);
            },
          ),
          SizedBox(height: 16),
          Text('予約可能な時間帯', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: availableTimeSlots.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(availableTimeSlots[index]),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // 予約ボタンが押されたときの処理をここに追加
                      // 例: 予約ダイアログを表示する
                    },
                    child: Text('予約する'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
