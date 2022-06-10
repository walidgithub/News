import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_api/constant/data_json.dart';
import 'package:food_api/pages/news_detail.dart';
import 'package:food_api/pages/science_detail.dart';
import 'package:food_api/pages/sport_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: SvgPicture.asset("assets/images/burger_icon.svg"),
            onPressed: () {}),
        actions: [
          IconButton(
              icon: SvgPicture.asset("assets/images/search_icon.svg"),
              onPressed: () {}),
          IconButton(
              icon: SvgPicture.asset("assets/images/language.svg"),
              onPressed: () {}),
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
      children: [
        Text(
          "We Report To You",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "News at Another Perspective",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BusinessDetailPage()));
          },
          child: Container(
            width: 160,
            height: 160,
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  left: 0,
                  child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 30) * 0.46,
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Business',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Business News',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          )),
                          Icon(Icons.play_arrow_rounded)
                        ],
                      )),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 15,
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/business.jpg'),
                          fit: BoxFit.cover)),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(categories.length, (index) {
              return GestureDetector(
                onTap: () {
                  if (categories[index]['name'] == 'Sport') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SportDetailPage()));
                  } else if (categories[index]['name'] == 'Science') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScienceDetailPage()));
                  }
                },
                child: Container(
                  // margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(),
                  width: (MediaQuery.of(context).size.width - 90) / 2,
                  height: 250,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 3,
                        top: 3,
                        child: Container(
                          width: 125,
                          height: 235,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  categories[index]['name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  categories[index]['description'],
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          // color: Colors.redAccent,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                categories[index]['image'],
                              ),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 10,
                                blurRadius: 10)
                          ],
                        ),
                      ),
                      Positioned(
                          left: 52,
                          top: 220,
                          child: Icon(
                            Icons.arrow_drop_down_circle_sharp,
                            size: 28,
                          ))
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
