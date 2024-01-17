import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessScreen extends StatefulWidget {
  @override
  _AccessScreenState createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen> {

  void _openUrl() async {
    const url = 'https://maps.app.goo.gl/YrAkgkaf5AkG4Uad8'; // 表示させたいURL
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
    } else {
      throw '申し訳ございません。このURLにはアクセスできません';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ACCESS'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            SizedBox(height: 80),

            // ----------------------ここからメイン---------------------------------
            Text(
              '＜Kano Studio Gifu（KSG)＞',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),


            Text('〒500-8288 岐阜市中鶉4-8-1'),
            Text('TEL. 090-8474-1155'),
            Text('(ライブ出演・PAオペレーションなどの日は不可の時間帯あり)'),
            Text('※スタジオスケジュールをご確認ください'),
            SizedBox(height: 30),
            Text(
              '＜アクセス＞',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text('お車の場合'),
            Text('笠松病院東の信号交差点を、南進約200m、左側。'),
            Text('※無料P 4台 (駐禁場所ではないため路駐も数台可)'),
            Text('公共交通機関の場合'),
            Text('岐阜バス、茜部三田洞線、鶉小学校前、下車。徒歩5分'),


            SizedBox(height: 30),


            GestureDetector(
              onTap: _openUrl,
              child: Text(
                'GoogleMapで見る',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
