import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaming_app/Constants/constants.dart';
import 'package:streaming_app/Controller/explore_page_controller.dart';
import 'package:streaming_app/Screens/Drawer/drawer.dart';
import 'package:streaming_app/Services/auth_service.dart';
import 'package:streaming_app/Services/get_all_users.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  double widthAnimation = 20;
  String uid = LocalStorage.gettoken('userid');
  String userName = LocalStorage.gettoken('name');
  String token = LocalStorage.gettoken("token");
  @override
  Widget build(BuildContext context) {
    ExplorePageController controller = Get.put(ExplorePageController());

    return Scaffold(
      drawer: DrawerWidget(widthAnimation: widthAnimation),
      appBar: AppBar(
        leadingWidth: 40,
        backgroundColor: primaryThemeColor,
        title: const Text(
          'Explore page',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 23),
        ),
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
      body: Scaffold(
        backgroundColor: primaryThemeColor,
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Upcoming Streamers',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            Obx(() {
              if (controller.loading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (controller.totalUsers.isEmpty) {
                return Center(
                  child: Text(
                    "No data found",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }

              return CarouselSlider.builder(
                itemCount: controller.totalUsers.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  final data = controller.totalUsers[itemIndex];

                  bool followed = data.followers!.any(
                    (element) => element.uid == uid,
                  );

                  print("vishnu");
                  print(controller.totalUsers[0].followers!.map((e) => e.id));

                  return Column(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('Assets/Images/images.jpg'),
                        radius: 40,
                      ),
                      Text(data.name.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(85, 7), primary: primaryColor),
                        onPressed: () {
                          // AllUsersService.getUserData();
                          if (followed) {
                            AllUsersService.unFollowUser({
                              "UserName": userName,
                              "uid": uid,
                              "_id": data.id,
                            }, token);
                          } else {
                            AllUsersService.followUser(
                              {
                                "UserName": userName,
                                "id": data.id,
                              },
                              token,
                            );
                          }
                        },
                        child: FittedBox(
                          child: Text(
                            followed ? "Unfollow" : 'Follow',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                options: CarouselOptions(
                  height: 150,
                  // aspectRatio: 15 / 10,
                  viewportFraction: 0.24,
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
              );
            }),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                'Discover Streams',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            const SizedBox(height: 15),
            ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 8,
                shrinkWrap: true,
                //  physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'Assets/Images/maxresdefault (1).jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage('Assets/Images/download.jpg'),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'My Long Awaited Steaming step-up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Shroud',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        // color: Colors.grey,
                                        constraints: const BoxConstraints(
                                            maxWidth: 60, maxHeight: 18),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            color: primaryDark),
                                        child: const Text(
                                          "Valorant",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
