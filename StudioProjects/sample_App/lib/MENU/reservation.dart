import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/MENU/user_bookings.dart';

void main() {
  runApp(MaterialApp(home: ReservationFormScreen()));
}

class ReservationFormScreen extends StatefulWidget {
  @override
  _ReservationFormScreenState createState() => _ReservationFormScreenState();
}

class _ReservationFormScreenState extends State<ReservationFormScreen> {
  DateTime? selectedDate; // selectedDateをメンバ変数として定義
  int _startHour = 9; // 開始時間の初期値をメンバ変数として定義
  int _endHour = 22; // 終了時間の初期値をメンバ変数として定義
  String? name; // nameをメンバ変数として定義
  String? phoneNumber; // phoneNumberをメンバ変数として定義
  String? feedbackMessage; // feedbackMessageをメンバ変数として定義

  void resetForm() {
    setState(() {
      selectedDate = null;
      _startHour = 9;
      _endHour = 22;
    });
  }

  void _finalizeReservation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('予約が完了しました'),
          content: Text('この度はKSGのご利用、誠にありがとうございます'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                resetForm();
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }



  // -------------------------------メインの部分------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('予約フォーム'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[


              // ----------------------------------日付選択--------------------------------------------------------
              Text(
                '----------------　　日付を選択　　----------------',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  OutlinedButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      selectedDate != null
                          ? DateFormat('yyyy年MM月dd日').format(selectedDate!)
                          : 'ここから選択',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                  SizedBox(height: 15), // 注意書きとボタンの間のスペースを調整
                  Text(
                    '※予約可能な期間は今日から2ヶ月先までとなります。',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              // ------------------------------------------------------------------------------


              SizedBox(height: 15),


              // ---------------------------------- 開始時間----------------------------------------
              Text(
                '---------------　　開始時間帯を選択　　------------',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),


              Container(
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: DropdownButtonHideUnderline( // ドロップダウンボタンの下線を非表示にする
                  child: DropdownButton<int>(
                    isExpanded: true,
                    value: _startHour,
                    onChanged: (int? newValue) {
                      setState(() {
                        _startHour = newValue!;
                      });
                    },
                    items: List.generate(22 - 9 + 1, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 9,
                        child: Center(
                          child: Text(
                          '${index + 9}時',
                          textAlign: TextAlign.center,
                        ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              // ----------------------------------------------------------------------------


              SizedBox(height: 15),


              // ----------------------------------終了時間--------------------------------------
              Text(
                '---------------　　終了時間帯を選択　　------------',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),


              SizedBox(height: 15),


              Container(
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: DropdownButtonHideUnderline( // ドロップダウンボタンの下線を非表示にする
                  child: DropdownButton<int>(
                    isExpanded: true,
                    value: _endHour,
                    onChanged: (int? newValue) {
                      setState(() {
                        _endHour = newValue!;
                      });
                    },
                    items: List.generate(22 - 9 + 1, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 9,
                        child: Center(
                          child: Text(
                            '${index + 9}時',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              // -------------------------------------------------------------------------


              SizedBox(height: 20),


              // -----------------------------名前----------------------------------------
              TextField(
                decoration: InputDecoration(labelText: '名前'),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              // --------------------------------------------------------------------------


              SizedBox(height: 20),


              // ----------------------------電話番号---------------------------------------
              TextField(
                decoration: InputDecoration(labelText: '電話番号'),
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),
              // ------------------------------------------------------------------------


              SizedBox(height: 20),


              // -----------------------------------------予約するボタン------------------------------------
              ElevatedButton(
                child: Text('予約する'),
                onPressed: () {
                  String? error;
                  if (selectedDate == null) {
                    error = '日付を選択してください。';
                  } else if (_startHour >= _endHour) {
                    error = '時間帯の設定に誤りがあります。';
                  } else if (name == null || name!.isEmpty) {
                    error = '名前を入力してください。';
                  } else if (phoneNumber == null ||
                      phoneNumber!.isEmpty ||
                      phoneNumber!.length != 11 ||
                      phoneNumber!.contains(RegExp(r'[^0-9]'))) {
                    error = '有効な電話番号を入力してください（ハイフンなし)';
                  }

                  if (error != null) {
                    _showErrorDialog(context, error);
                  } else {
                    _confirmReservation(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  // ---------------------日付選択を60日以内に制限-------------------------

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime nextTwoMonths = currentDate.add(Duration(days: 60));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? currentDate,
      firstDate: currentDate,
      lastDate: nextTwoMonths,
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // ----------------------------------------------------


  // --------------------エラーメッセージの設定--------------------

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('エラー'),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


//----------------予約確認のダイアログ----------------------

  void _confirmReservation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('予約内容の確認'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('　日付　: 　${selectedDate != null ? DateFormat("MM月-dd日").format(selectedDate!) : '未選択'}'),
              Text('　時間　:　 $_startHour時 〜 $_endHour時'),
              Text('　名前　: 　${name ?? '未入力'}'),
              Text('電話番号: 　${phoneNumber ?? '未入力'}'),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // 予約の確定処理を実行する場合はここに追加
                Navigator.of(context).pop();
                _finalizeReservation(context);
              },
              child: Text('確定'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('キャンセル'),
            ),
          ],
        );
      },
    );
  }
}

