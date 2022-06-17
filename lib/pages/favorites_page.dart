import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import '../cubit/news_cubit.dart';
import '../cubit/news_state.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/news_slider.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: getBody(),
        );
      },
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 40),
                child: Column(
                  // overflow: Overflow.visible,
                  children: [
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider.builder(
                        itemCount: NewsCubit.get(context).BusinessList.length,
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setActiveDot(index);
                          },
                          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                          autoPlayAnimationDuration: Duration(seconds: 2),
                          viewportFraction: 1.0,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return Image(
                            image: NetworkImage(NewsCubit.get(context)
                                .BusinessList[index]['urlToImage']),
                          );
                        },
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            NewsCubit.get(context).BusinessList.length, (idx) {
                          return activeIndex == idx
                              ? ActiveDot()
                              : InactiveDot();
                        }))
                  ],
                ),
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  NewsCubit.get(context).BusinessList[activeIndex]['title'] ==
                      null
                      ? 'Undefined'
                      : NewsCubit.get(context).BusinessList[activeIndex]
                  ['title'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  NewsCubit.get(context).BusinessList[activeIndex]
                  ['description'] ==
                      null
                      ? 'Undefined'
                      : NewsCubit.get(context).BusinessList[activeIndex]
                  ['description'],
                  style: TextStyle(height: 1.3, fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Author:"),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          NewsCubit.get(context).BusinessList[activeIndex]
                          ['author'] ==
                              null
                              ? 'Undefined'
                              : NewsCubit.get(context).BusinessList[activeIndex]
                          ['author'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Published At:",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 10),
                        Text(
                          NewsCubit.get(context).BusinessList[activeIndex]
                          ['publishedAt'] ==
                              null
                              ? 'Undefined'
                              : NewsCubit.get(context).BusinessList[activeIndex]
                          ['publishedAt'],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
