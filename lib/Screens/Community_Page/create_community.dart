import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaming_app/Model/create_community.dart';
import 'package:streaming_app/Services/auth_service.dart';
import 'package:streaming_app/Services/create_community_service.dart';

import '../../Constants/constants.dart';

class CreateCommunity extends StatelessWidget {
  CreateCommunity({Key? key}) : super(key: key);
  final TextEditingController dcontroller = TextEditingController();
  final TextEditingController ncontroller = TextEditingController();

  final TextEditingController tcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryThemeColor,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Communtiy name ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: ncontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*required";
                  }

                  return null;
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
              Text(
                'Topic',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white),
              ),
              TextFormField(
                controller: tcontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*required";
                  }

                  return null;
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
              Text(
                'Description',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white),
              ),
              TextFormField(
                controller: dcontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*required";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: primaryDark,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelStyle: const TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: primaryOrange),
                onPressed: () {
                  CreateCommunityService.cretecommunity({
                    'Description': dcontroller.text.trim(),
                    'Topic': tcontroller.text.trim(),
                    'Name': ncontroller.text.trim()
                  }, context);
                  Get.back();
                },
                child: const Text(
                  'Create ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
