import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sample_app/MENU/price.dart';
import 'package:sample_app/MENU/schedule.dart';
import 'package:sample_app/MENU/studio_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'MENU/user_bookings.dart';
import 'MENU/access.dart';
import 'MENU/contact.dart';
import 'MENU/facility.dart';
import 'MENU/news.dart';
import 'MENU/origami.dart';
import 'MENU/reservation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ja', ''), // 日本語
        const Locale('en', ''), // 英語
        // 追加の言語をサポートする場合はここに追加
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Kano Studio Gifu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  final menuList = [
    'Top',
    '予約履歴',
    '機材・設備',
    '料金',
    'スタジオイメージ',
    'スケジュール',
    '折り紙作品',
    'アクセス',
    'お問い合わせ',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kano Studio Gifu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: ReservationFormScreen(),
      ),

      // -----------------------------Drawer------------------------
      drawer: Drawer(
        child: ListView(
          children: [
            const Divider(
              thickness: 1.0,
              color: Colors.white,
            ),
            ...menuList.map((e) => listTile(e)),
          ],
        ),
      ),
    );
  }

  Widget listTile(String title) {
    IconData icon;
    switch (title) {
      case 'Top':
        icon = Icons.home;
        break;
      case '予約履歴':
        icon = Icons.history;
        break;
      case '機材・設備':
        icon = Icons.settings;
        break;
      case '料金':
        icon = Icons.attach_money;
        break;
      case 'スタジオイメージ':
        icon = Icons.image;
        break;
      case 'スケジュール':
        icon = Icons.calendar_today;
        break;
      case '折り紙作品':
        icon = Icons.palette;
        break;
      case 'アクセス':
        icon = Icons.location_on;
        break;
      case 'お問い合わせ':
        icon = Icons.mail;
        break;
      default:
        icon = Icons.error; // デフォルトのアイコン
    }

    return GestureDetector(
      onTap: () {
        navigateToScreen(title);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Icon(icon),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }


  void navigateToScreen(String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        switch (title) {
          case 'Top':
            return const MyApp();
          case '予約履歴':
            return ReservationHistoryPage();
          case '機材・設備':
            return EquipmentFacilitiesScreen();
          case '料金':
            return PricingScreen();
          case 'スタジオイメージ':
            return StudioImagesScreen();
          case 'スケジュール':
            return ScheduleScreen();
          case '折り紙作品':
            return OrigamiArtScreen();
          case 'NEWS':
            return NewsScreen();
          case 'アクセス':
            return AccessScreen();
          case 'お問い合わせ':
            return ContactScreen();
          default:
            return Container();
        }
      }),
    );
  }
}
