import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:streaming_app/Constants/constants.dart';

import 'direct_message.dart';

class DmMessagesList extends StatelessWidget {
  const DmMessagesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0.8,
                backgroundColor: primaryColor,
                expandedHeight: 150,
                pinned: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => AddStudentForm(
                        //             isEditing: false,
                        //           )),
                        // );
                      },
                    ),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Chats',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  titlePadding: const EdgeInsetsDirectional.only(
                    start: 20,
                    bottom: 10,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.amber),
                        ),
                      ),
                    ),
                  ),
                  ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                DirectMessage()
                            ),
                          );
                        },
                        leading: CircleAvatar(),
                        title: Text('User Name'),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: 10,
                    shrinkWrap: true,
                    primary: false,
                  ),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}
