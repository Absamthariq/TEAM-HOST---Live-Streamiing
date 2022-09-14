import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streaming_app/Constants/constants.dart';

import '../Sign Up page/register.dart';
import '../login Page/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(
      //   title: Text('Welcme'),
      // ),
      body: Column(
        children: [
          Container(
            height: size.height * .6,
            width: double.infinity,
            color: primaryColor,
          ),
          Text(
            'Welcome to Communitty',
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Color.fromARGB(255, 231, 230, 230),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Join Over 100 Million People Who Use Community To Talk With Communities And Friends',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white54, fontWeight: FontWeight.w700),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  RegisterPage()),
                          );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(size.width * .8, 30),
              primary: primaryOrange,
            ),
            child: const Text(
              'Register',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          ElevatedButton(
            onPressed: () {
            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  LoginPage()),
                        );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(size.width * .8, 30),
              primary: primaryDark,
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
