import 'package:flutter/material.dart';

class EquipmentFacilitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('機材・設備'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SectionTitle(title: 'スタジオ'),
              FacilityItem(title: 'プレーヤースタジオ', description: '8.2帖'),
              FacilityItem(title: 'サブスタジオ', description: '3.6帖'),

              SectionTitle(title: '楽器'),
              FacilityItem(title: 'ドラムセット', description: 'Gretch'),
              FacilityItem(title: 'エレキギター', description: '5つ'),
              FacilityItem(title: 'エレキベース', description: '1つ'),

              SectionTitle(title: 'アンプ'),
              FacilityItem(title: 'ギターアンプ', description: '3つ'),
              FacilityItem(title: 'ベースアンプ', description: '2つ'),

              SectionTitle(title: 'キーボード'),
              FacilityItem(title: '電子ピアノ', description: 'ROLAND'),

              SectionTitle(title: '音響機材'),
              FacilityItem(title: '12chパワーミキサー', description: ''),
              FacilityItem(title: '8chサブミキサー', description: ''),
              FacilityItem(title: 'PAスピーカー', description: '4つ'),
              FacilityItem(title: 'PAパワードスピーカー', description: '3つ'),
              FacilityItem(title: 'インイヤーモニター', description: '8つ'),
              FacilityItem(title: 'ワイヤレスマイク', description: '5つ'),
              FacilityItem(title: '有線マイク SHURE58', description: '5つ'),
              FacilityItem(title: '有線マイク SHURE57', description: '5つ'),
              FacilityItem(title: 'スタジオモニター', description: 'BOSE'),
              FacilityItem(title: 'superウーハー', description: ''),

              SectionTitle(title: 'オーディオ/ビデオ機材'),
              FacilityItem(title: 'BD/DVD/CDデッキ', description: ''),
              FacilityItem(title: 'MDデッキ', description: ''),

              SectionTitle(title: 'その他'),
              FacilityItem(title: 'マイクスタンド', description: ''),
              FacilityItem(title: '楽譜たて', description: ''),
              FacilityItem(title: '16chマルチケーブル/BOX', description: ''),
              FacilityItem(title: '楽器用ワイヤレスシステム', description: '等'),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class FacilityItem extends StatelessWidget {
  final String title;
  final String description;

  FacilityItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 16)),
          Text(description, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
