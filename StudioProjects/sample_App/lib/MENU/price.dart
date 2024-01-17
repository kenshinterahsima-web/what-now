import 'package:flutter/material.dart';

class PricingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('料金一覧'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  '料金システム (予約制限にご注意)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              // 料金情報をカードで囲む
              Center(
                child: Card(
                  elevation: 5, // カードの影を追加
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Text('スタジオレンタル料金'),
                        Text('9:00～22:00'),
                        Text('※8時～9時や22時～23時は時間外料金'),
                        Text('17時以降は予約制限 (1ヶ月5回まで)'),
                        Text('人数に応じて料金が異なります'),
                        Text('10分単位：100円'),
                        Text('１時間単位：500円'),
                        Text('前売り回数券もあります'),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              Center(
                child: Text(
                  '楽器・機材レンタル',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              // 機材レンタル情報をカードで囲む
              Center(
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Text('マイク・PA・アンプ類・ハイビジョンプロジェクタ：無料'),
                        Text('アコギ・エレキ・ベース・ピアノ：100円'),
                        Text('ドラム：2時間100円'),
                        Text('レコーディングオペレーション：1時間 500円'),
                        Text('修理実費が発生する可能性があります'),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),


              Center(
                child: Text(
                  'レッスン',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Text('レッスン内容はお気軽にお問い合わせください。'),
                    Text('ドラム・エレキ・アコギ・ベースのレッスン料：スタジオ使用料＋レッスン料 (30分300円、1時間500円)'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
