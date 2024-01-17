import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:voice/voice_list.dart';


void main() {
  runApp(MaterialApp(home: MyApp()));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Content {
  String title;
  String content;

  Content(this.title, this.content);
}

class _MyAppState extends State<MyApp> {

  // DEMO: 本来はAPIから取得する
  var contents = [
    Content('１月２３日の出荷について', '''内容:アプリ内での新鮮な漁獲物の供給についての商談。需要はマグロや鮭などの大型魚介類で、月に30トンの供給が必要。長期的な取引を希望し、競争力のある価格を求める。結果:漁師の太郎さんは漁場で豊富なマグロや鮭の供給が可能。具体的な価格や供給量についての条件交渉が続く見込み。'''),

    Content('値下げについて', '''
内容:
製品価格の見直しについて協議中。
市場の競争が激化しており、顧客からのニーズに応えるために価格を見直す必要がある。
具体的な値下げ幅やタイミングについての提案を行っていく予定。
'''),
    Content('日程の変更について', '''
内容:
イベントの日程変更に関するお知らせ。
予定していた日程に重なる他のイベントのため、開催日を変更することとなりました。
参加者の皆様にはご迷惑をおかけしますが、何卒ご理解いただけますようお願い申し上げます。
新しい日程については追ってお知らせいたします。
'''),
  ];
  // ==================================

  void _startRecording() {
    print("録音を開始しました");
    var size = MediaQuery.of(context).size;
    var dotsSize = size.width / 5;


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('録音中',style: TextStyle(color: Colors.redAccent),),
          content: Container(
            height: size.height / 7, // Set the height of the dialog content
            child: Center(
              child: LoadingAnimationWidget.stretchedDots(
                color: Colors.redAccent,
                size: dotsSize,
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text('録音を終了'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Colors.indigo[50]),
      ),
      home: Scaffold(
        appBar: AppBar(

        ),
        body: VoiceList(contents),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 16.0),
          child: FloatingActionButton.extended(
            onPressed: _startRecording,
            icon: Icon(Icons.mic),
            label: Text('録音を開始'),
            backgroundColor: Colors.redAccent,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}



