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
    Size size = MediaQuery.of(context).size;

    emailController.text = "absamthariq123@gmail.com";
    passwordController.text = "absam123";
    return Scaffold(
      backgroundColor: primaryThemeColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: const [
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Please sign in to your accout',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                    // const Text(
                    //   'Login',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 17,
                    //       color: Colors.white),
                    // ),
                    // SizedBox(height: 10),
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
                    // const Text(
                    //   'Password',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 17,
                    //       color: Colors.white),
                    // ),
                    // SizedBox(height: 10),
                    TextFormField(
                      
                      style: TextStyle(color: Colors.white),
                      focusNode: FocusNode(),
                      obscureText: true,
                      controller: passwordController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "*required";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: primaryColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 50),
                    Center(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        fixedSize: Size(size.width * .9,50),
                        primary: primaryOrange,
                      ),
                      onPressed: () async {
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
        ],
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
      focusNode: FocusNode(),
      style: TextStyle(color: Colors.white),
      controller: emailController,
      validator: validator,
      decoration: InputDecoration(
         hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: primaryColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
