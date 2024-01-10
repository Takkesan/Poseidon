import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var titles = [
    '１月２３日の出荷について','値下げについて','日程の変更について',
  ];

  void _startRecording() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('録音中'),
          content: Text('録音を開始しました。'),
        );
      },
    );
    // ここに録音を開始するコードを書く
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
        body: VoiceList(titles),
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

class VoiceList extends StatelessWidget {
  final List<String> titles;

  VoiceList(this.titles);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(titles[index],
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewPage()),
              );
            },
          ),
        );
      },
    );
  }
}

class NewPage extends StatelessWidget {
  var content = '１月２３日の出荷につ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('要約'),
      ),
      body: Center(
        child: Text(content,
          style: Theme.of(context).textTheme.headlineSmall,
      ),),
    );
  }
}