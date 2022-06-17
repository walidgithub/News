import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SafeArea(
                  child: Row(
                    children: [
                      IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text('Explore the News app',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 20,
                ),
                Text('  On your iPhone, open the News app. Then use the tabs at the bottom of the screen to navigate between different types of content.',style: TextStyle(fontSize: 20),),
                SizedBox(
                  height: 20,
                ),
                Text('  On your iPad or Mac, open the News app. Then use the sidebar to navigate between different types of content. Don\'t see the sidebar? Tap or click the Sidebar button.',style: TextStyle(fontSize: 20),),
                SizedBox(
                  height: 30,
                ),
                Text('Today',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 20,
                ),
                Text('  Today is your feed of top stories curated by Apple News editors, and stories from the channels'
                    ' and topics that you follow. Your feed also shows you stories suggested by Siri and trending stories that are popular with other'
                    ' readers. As you read, Apple News learns your interests, then suggests stories that you might like.',style: TextStyle(fontSize: 20),),
                SizedBox(
                  height: 20,
                ),
                Text('  You can read some Apple News stories for free in the Today feed. To access premium content, you need a subscription.',style: TextStyle(fontSize: 20),)
              ],
            )
          )
        ]));
  }
}