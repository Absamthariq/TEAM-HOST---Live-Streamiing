import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaming_app/Screens/Chats%20interface/group_chats.dart';

import '../../Constants/constants.dart';
import '../../Controller/community_controller.dart';
import '../Settings Page/settings.dart';

double widthAnimation = 20;

class DrawerWidget extends StatefulWidget {
  DrawerWidget({
    Key? key,
    required this.widthAnimation,
  }) : super(key: key);

  double widthAnimation = 20;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void dispose() {
    // TODO: implement dispose
    widget.widthAnimation = 0;
    super.dispose();
    print('Drwaer Dismissed');
  }

  @override
  Widget build(BuildContext context) {
        CommunityController controller = Get.put(CommunityController());

    return Drawer(
      backgroundColor: primaryColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()),
                        );
                      },
                      child: Stack(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: widget.widthAnimation,
                            height: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: primaryDark),
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  'AbsamThariq',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('Assets/Images/images.jpg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15.0,
                          fixedSize: Size(80, 7),
                          primary: Colors.green),
                      onPressed: () {},
                      child: const Text(
                        'Online',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                const Text(
                  'Groups',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 23),
                )
              ],
            ),
          ),
          Obx(
            () {
               if (controller.loading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.totalCommunity!.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(
                          'Assets/Images/Fortnite_F_lettermark_logo.png'),
                    ),
                    title:  Text(
                      controller.totalCommunity![index].name!,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatInterface()),
                      );
                    },
                    trailing: Wrap(
                      children:  [
                        Padding(
                          padding: EdgeInsets.only(right: 8, top: 2),
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 5,
                          ),
                        ),
                        Text(
                         ' ${controller.totalCommunity![index].members!.length.toString()}  Online',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
