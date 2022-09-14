import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:streaming_app/Constants/constants.dart';
import 'package:streaming_app/Screens/Community_Page/community_page.dart';
import 'package:streaming_app/Screens/Explore_Page/explore_page.dart';
import 'package:streaming_app/Screens/HomePage/home_page.dart';
import 'package:streaming_app/Screens/News_page/news_page.dart';

class FloatingNavbar extends StatelessWidget {
  const FloatingNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingNavBar(
      
      resizeToAvoidBottomInset: false,
      color: Color.fromRGBO(30, 37, 48, 1),
      selectedIconColor: primaryOrange,
      unselectedIconColor: Colors.white.withOpacity(0.6),
      items: [
        FloatingNavBarItem(
            iconData: Icons.home_outlined,
            page: const HomePage(),
            title: 'Home'),
        FloatingNavBarItem(
            iconData: Icons.explore,
            page: const ExplorePage(),
            title: 'Doctors'),
        FloatingNavBarItem(
            iconData: Icons.newspaper_outlined, page: NewsPage(), title: 'Reminders'),
        FloatingNavBarItem(
            iconData: Icons.groups,
            page: CommunityPage(),
            title: 'Records'),
      ],
      horizontalPadding: 10.0,
      hapticFeedback: true,
      showTitle: false,
    );
  }
}
