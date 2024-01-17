import 'package:flutter/material.dart';

class OrigamiArtScreen extends StatelessWidget {
  // 仮の写真リスト
  final List<String> photoList = [

    'assets/images',
    'photo2.jpg',
    'photo3.jpg',
    // 他の写真ファイル名を追加
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Album'),
      ),
      body: GridView.builder(
        itemCount: photoList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2列で表示
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // 写真をタップしたときの処理を追加
              // 例えば、拡大表示などのアクションを実装できます
              // Navigator.push などを使用して個々の写真の詳細画面に遷移することも可能です
            },
            child: Image.asset(
              photoList[index], // 写真のファイル名
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
