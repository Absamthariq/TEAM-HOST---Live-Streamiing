import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaming_app/Constants/constants.dart';
import 'package:streaming_app/Screens/WelocmePage/welcome_page.dart';

import 'refactor.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: primaryThemeColor,
        title: Text('Setting'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Container(
              height: 320,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: primaryColor,
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Stack(
                    children: const [
                      CircleAvatar(
                        backgroundImage: AssetImage('Assets/Images/images.jpg'),
                        radius: 70,
                      ),
                      Positioned(
                        bottom: 5,
                        right: 8,
                        child: CircleAvatar(
                            radius: 15, backgroundColor: Colors.green),
                      )
                    ],
                  ),
                  const Text(
                    'Absam Thariq',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 23),
                  ),
                  SizedBox(height: 1),
                  const Text(
                    '@arseButcher',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: primaryOrange,
                        fontSize: 15),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: const [
                          Text(
                            'Friends',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          Text(
                            '420',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: primaryOrange,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                        child: VerticalDivider(
                            thickness: 2, width: 20, color: primaryOrange),
                      ),
                      Column(
                        children: const [
                          Text(
                            'Groups',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          Text(
                            '69',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: primaryOrange,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            const Text(
              'Friends',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
            SizedBox(height: 15),
            SettingsListTile(
              title: 'Add Friends',
              icons: Icons.person_add,
            ),
            SizedBox(height: 10),
            SettingsListTile(
              title: 'Friends',
              icons: Icons.person,
            ),
            SizedBox(height: 20),
            const Text(
              'User Settings',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
            SizedBox(height: 10),
            SettingsListTile(
              icons: Icons.person_pin,
              title: 'Set Status',
            ),
            SizedBox(height: 10),
            // SettingsListTile(title: 'My Account', icons: Icons.account_circle),
            // SizedBox(height: 10),
            SettingsListTile(
                title: 'User Profile', icons: Icons.account_box_rounded),
            SizedBox(height: 10),
            SettingsListTile(
                title: 'Apperance', icons: Icons.brightness_medium),
            SizedBox(height: 10),
            SettingsListTile(title: 'Privacy', icons: Icons.privacy_tip),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(WelcomePage());
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
