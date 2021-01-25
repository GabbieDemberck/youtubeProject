import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_project/components/search.dart';
import 'package:youtube_project/components/video_list.dart';
import 'package:youtube_project/icon_choices.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final _title = 'Youtube';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.screen_share_outlined,
              size: 25.0,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              size: 25.0,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              size: 25.0,
            ),
            onPressed: () {
              showSearch(context: context, delegate: SearchBase());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: VideoList(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(choices[0].icon),
            label: (choices[0].label),
          ),
          BottomNavigationBarItem(
            icon: Icon(choices[1].icon),
            label: (choices[1].label),
          ),
          BottomNavigationBarItem(
            icon: Icon(choices[2].icon, size: 40.0),
            label: (choices[2].label),
          ),
          BottomNavigationBarItem(
            icon: Icon(choices[3].icon),
            label: (choices[3].label),
          ),
          BottomNavigationBarItem(
            icon: Icon(choices[4].icon),
            label: (choices[4].label),
          ),
        ],
        selectedItemColor: Colors.grey[800],
        unselectedItemColor: Colors.black,
        onTap: (index) {},
      ),
    );
  }
}
