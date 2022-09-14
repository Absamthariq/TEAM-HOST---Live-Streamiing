import 'package:flutter/material.dart';
import 'package:streaming_app/Constants/constants.dart';
import 'package:streaming_app/Screens/login%20Page/login_page.dart';
import 'package:streaming_app/Services/sign_up_service.dart';

import '../navigation_bar/navbar.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({Key? key}) : super(key: key);



  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
              "Assets/Images/OC-Minimal-Gaming-Background-4800x2400-wallpapers.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 480,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.grey[400]!.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        const Text(
                          'Email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        
                        TextFormField(
                          validator: (value) {
                              if (value!.isEmpty) {
                                return "*required";
                              }

                              return null;
                            },
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: primaryDark,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'User name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                        TextFormField(
                          validator: (String? value) {
                              if (value!.isEmpty) {
                                return "*required";
                              }

                              return null;
                            },
                          controller: usernameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: primaryDark,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                        const Text(
                          'Password',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (String? value) {
                              if (value!.isEmpty) {
                                return "*required";
                              }

                              return null;
                            },
                          controller: passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: primaryDark,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                       
                        Center(
                            child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: primaryOrange),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                                SignInAuthService.loginUser({
                                  'email': emailController.text.trim(),
                                  'password': passwordController.text.trim(),
                                  'name': usernameController.text.trim(),
                                }, context);
                            //      Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>  LoginPage()),
                            // );
                              }
                              // SignInAuthService.loginUser({
                              //   'email': emailController.text.trim(),
                              //   'password': passwordController.text.trim(),
                              // });
                           
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
