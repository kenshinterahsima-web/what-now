import 'package:flutter/material.dart';

class StudioImagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スタジオイメージ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.blue, // 写真を表示するためにカラーを変更してください
              // ここに写真ウィジェットを追加することができます
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SectionTitle(title: '楽器を楽しむ場所'),
                  Text(
                    '楽器が持っていなくても大丈夫。遮音性も十分なので、気ままにお楽しみください。'
                        'お気に入りミュージシャンのBD/DVDを大画面で映しながら練習すれば、セッション気分も満点です。',
                    style: TextStyle(fontSize: 16),
                  ),

                  SectionTitle(title: '利用用途'),
                  Text(
                    'ドラム、アコギ、ベース、エレキ、キーボード、トランペット、フルート、バイオリンなどの楽器、'
                        'ボーカル(カラオケ)、などの個人練習、また、少人数のバンド練習に最適。'
                        'さらに、お気に入りBD/DVDを180cm×120cmの大スクリーンに映しながらのライブ感覚セッショントレーニングが可能。'
                        'もちろん、iPadや各種音源をつないで、お好みの音楽にのせて練習することもできます。',
                    style: TextStyle(fontSize: 16),
                  ),

                  SectionTitle(title: '楽器の貸し出し'),
                  Text(
                    '生ドラム、アコギ、ベース、エレキ、ピアノ、マイク、アンプ、PA等の楽器・機材があり、'
                        'マイク、アンプ、PAは無料、その他の各楽器は100円です(トラムだけは2時間で100円)。',
                    style: TextStyle(fontSize: 16),
                  ),

                  SectionTitle(title: '軽レッスン可能'),
                  Text(
                    '基本的にセルフトレーニングスペースの提供となりますが、ドラム・ギター・ベースのレッスンは初心者から中・上級者まで承ります。'
                        '(料金システムをご覧ください)',
                    style: TextStyle(fontSize: 16),
                  ),

                  SectionTitle(title: '機材の貸し出し '
                      '(PA関係が大幅にパワーアップしました！！)'),
                  Text(
                    '必要に応じ対応可能です。小中イベントに対応 ※（料金応談）',
                    style: TextStyle(fontSize: 16),
                  ),

                  SectionTitle(title: '音漏れへの対策'),
                  Text(
                    'スタジオ壁内はコンクリート処理施工されており、'
                        'また、扉や天井には吸音材、窓は4重、換気扇も長菅化することで音漏れを最小限にしてあります。'
                        'スタジオ内でうるさいくらいの音を出しても、外ではほとんど分かりません。'
                        'また、インイヤーモニターを使用していただければ、時間外でも可能です。'
                        'ただ、常識外の音量には対応できませんので、生ドラムや大出力アンプ等の持ち込みはお断りしています。',
                    style: TextStyle(fontSize: 16),
                  ),

                  SectionTitle(title: '飲食について'),
                  Text(
                    '軽い飲食は常識の範囲内で自由です。'
                        'ドリンクホルダーを各所に設置してあります。積極的にお使いください。'
                        'ただ、喫煙につきましては機材への影響もあり、ご遠慮ねがいます。'
                        'また、外での喫煙の際には近隣の方々の方へ煙が行かないような配慮をお願いします。',
                    style: TextStyle(fontSize: 16),
                  ),

                  SizedBox(height: 15),


                ],
              ),
            ),
          ],
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
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
