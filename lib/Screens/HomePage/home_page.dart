import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:streaming_app/Constants/constants.dart';
import 'package:streaming_app/Screens/Chats%20interface/direct_message.dart';
import 'package:streaming_app/Screens/Chats%20interface/dms_list.dart';
import 'package:streaming_app/Screens/Settings%20Page/settings.dart';
import 'package:streaming_app/Screens/login%20Page/login_page.dart';

import '../Drawer/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double widthAnimation = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(widthAnimation: widthAnimation),
      backgroundColor: primaryThemeColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // toolbarHeight: 35,
            backgroundColor: primaryThemeColor,
            expandedHeight: 100,
            floating: true,
            // title: Text('Welcome back Absam'),
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Following',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              titlePadding: EdgeInsetsDirectional.only(
                start: 40,
                bottom: 10,
              ),
            ),
            leadingWidth: 40,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DmMessagesList()),
                        );
                },
                icon: const Icon(Icons.chat),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                ),
              ),
            ],

            leading: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
                Future.delayed(Duration(milliseconds: 30), (() {
                  setState(() {
                    widthAnimation = 180;
                  });
                }));
              },
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 5,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('Assets/Images/images.jpg'),
                ),
              ),
            );
          },
        ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                    'Assets/Images/marvels-spider-man-mobile-wallpaper-03-en-15dec20.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 3, top: 3),
                          child: Text(
                            'Spider-Man(2020)',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.redAccent,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '31.k',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  options: CarouselOptions(
                    height: 270,
                    // aspectRatio: 15 / 10,
                    viewportFraction: 0.4,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                // SizedBox(
                //   height: 2,
                // ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Your Live streams',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage(
                                      'Assets/Images/maxresdefault.jpg',
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    CircleAvatar(
                                      radius: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'YoYoAMEEnn',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'See ME Score headshots',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                const Text(
                                  'Game name',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
