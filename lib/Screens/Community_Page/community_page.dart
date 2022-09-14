import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaming_app/Constants/constants.dart';
import 'package:streaming_app/Controller/community_controller.dart';
import 'package:streaming_app/Screens/Community_Page/create_community.dart';
import 'package:streaming_app/Screens/Drawer/drawer.dart';
import 'package:streaming_app/Screens/Group%20Details/group_details.dart';
import 'package:streaming_app/Services/community_service.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  double widthAnimation = 20;

  @override
  Widget build(BuildContext context) {
    CommunityController controller = Get.put(CommunityController());

    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryThemeColor,
        title: const Text(
          'Community',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
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
            // IconButton(
            //   icon: const Icon(Icons.abc),
            //   onPressed: () {
            //     Scaffold.of(context).openDrawer();
            //   },
            //   tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            // );
          },
        ),
        leadingWidth: 40,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  CreateCommunity()),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: DrawerWidget(widthAnimation: widthAnimation),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   AllCommunityService.getCommunityData();
      // },),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 15, top: 5),
                child: Text(
                  'Recommended',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
              Obx(
                () {
                  if (controller.loading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return CarouselSlider.builder(
                    itemCount: controller.totalCommunity!.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      // final data = controller.totalCommunity[itemIndex]
                      // ;

                    

                      return Stack(
                        children: [
                          Container(
                              height: 180,
                              width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColor),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    controller.totalCommunity![itemIndex].name!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '31.2k Members',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                ],
                              )),
                          Container(
                            height: 90,
                            width: 180,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                    'Assets/Images/HD-wallpaper-fortnite-battle-royale-poster-2019-games-fortnite-cyber-warriors-fortnite-characters-fortnite.jpg',
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                    'Assets/Images/Fortnite_F_lettermark_logo.png'),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    options: CarouselOptions(
                      height: 180,
                      // aspectRatio: 15 / 10,
                      viewportFraction: 0.5,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Trending Communities',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Obx(
                () {
                  if (controller.loading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }


                  print("all community page rendered");
                  print(controller.totalCommunity!.last.name);

                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.totalCommunity!.length,
                      itemBuilder: (BuildContext context, index) {
                        final data = controller.totalCommunity![index];

                        return ListTile(
                          onTap: () {
                            AllCommunityService.getCommunityData();

                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const GroupDetails()),
                            // );
                          },
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          title: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'Assets/Images/valorant-logo-FAB2CA0E55-seeklogo.com.png'),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                data.name!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
              ),
              SizedBox(height: 130,)
            ],
          ),
        ],
      ),
    );
  }
}
