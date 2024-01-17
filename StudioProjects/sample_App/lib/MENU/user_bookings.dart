import 'package:flutter/material.dart';

// 仮の予約情報モデル
class Reservation {
  final String name;
  final DateTime date;
  final String time;

  Reservation({
    required this.name,
    required this.date,
    required this.time,
  });
}

// 予約履歴ページ
class ReservationHistoryPage extends StatelessWidget {
  final List<Reservation> reservations = [
    Reservation(name: 'John Doe', date: DateTime(2023, 11, 20), time: '10:00 AM'),
    Reservation(name: 'Alice Smith', date: DateTime(2023, 11, 21), time: '2:00 PM'),
    // 他の予約情報も同様に追加
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('予約履歴'),
      ),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return ListTile(
            title: Text(reservation.name),
            subtitle: Text('Date: ${reservation.date.toString().split(' ')[0]}, Time: ${reservation.time}'),
            // タップ時の処理を追加（例えば、予約の詳細を表示するなど）
            onTap: () {
              // ここにタップ時の処理を追加
              // 例: showDialog()を使って詳細を表示するなど
            },
          );
        },
      ),
    );
  }
}
