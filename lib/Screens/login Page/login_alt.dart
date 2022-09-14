import 'package:flutter/material.dart';
import 'package:streaming_app/Constants/constants.dart';
import 'package:streaming_app/Screens/navigation_bar/navbar.dart';
import 'package:streaming_app/Services/auth_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    emailController.text ="absamthariq123@gmail.com";
    passwordController.text = "absam123";
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'WELCOME BACK',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 65,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          BuildTextformfield(
                            emailController: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "*required";
                              }

                              return null;
                            },
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
                          
                            controller: passwordController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "*required";
                              }
                            },
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
                            style: ElevatedButton.styleFrom(
                                primary: primaryOrange),
                            onPressed: () async{
                              if (_formKey.currentState!.validate()) {
                                await UserAuthService.loginUser({
                                  'email': emailController.text.trim(),
                                  'password': passwordController.text.trim(),
                                }, context);
                                print(LocalStorage.gettoken('token'));
                               
                              }
                              // UserAuthService.loginUser({
                              //   'email': emailController.text.trim(),
                              //   'password': passwordController.text.trim(),
                              // });

                             
                            },
                            child: const Text(
                              'Log In',
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildTextformfield extends StatelessWidget {
  const BuildTextformfield({
    Key? key,
    required this.emailController,
    required this.validator,
  }) : super(key: key);

  final TextEditingController emailController;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: primaryDark,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
