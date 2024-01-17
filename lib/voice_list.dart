import 'package:flutter/material.dart';
import 'package:voice/detail_page.dart';
import 'package:voice/main.dart';

class VoiceList extends StatelessWidget {
  final List<Content> contents;

  VoiceList(this.contents);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contents.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(contents[index].title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage(content: contents[index].content),),
              );
            },
          ),
        );
      },
    );
  }
}