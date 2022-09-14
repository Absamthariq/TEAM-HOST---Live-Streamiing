import 'package:flutter/material.dart';
import 'package:streaming_app/Constants/constants.dart';

class ChatInterface extends StatelessWidget {
  const ChatInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Group Name'),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              const ListTile(
                leading: CircleAvatar(),
                title: Text('Ameen',
                    style: TextStyle(color: primaryOrange, fontSize: 12)),
                subtitle: Text('Hello',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white)),
              ),
              const ListTile(
                leading: CircleAvatar(),
                title: Text('Ameen',
                    style: TextStyle(color: primaryOrange, fontSize: 12)),
                subtitle: Text('Hello',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white)),
              ),
              ListTile(
                trailing: Wrap(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 9),
                      child: Text('heyy',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white)),
                    ),
                    SizedBox(width: 12),
                    CircleAvatar(),
                  ],
                ),
              ),
              const ListTile(
                leading: CircleAvatar(),
                title: Text('Ameen',
                    style: TextStyle(color: primaryOrange, fontSize: 12)),
                subtitle: Text('Hello',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white)),
              ),
              const ListTile(
                leading: CircleAvatar(),
                title: Text('Ameen',
                    style: TextStyle(color: primaryOrange, fontSize: 12)),
                subtitle: Text('Hello',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white)),
              ),
              const ListTile(
                leading: CircleAvatar(),
                title: Text('Ameen',
                    style: TextStyle(color: primaryOrange, fontSize: 12)),
                subtitle: Text('Hello',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white)),
              ),
              ListTile(
                trailing: Wrap(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 9),
                      child: Text('heyy',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white)),
                    ),
                    SizedBox(width: 12),
                    CircleAvatar(),
                  ],
                ),
              ),
              const ListTile(
                leading: CircleAvatar(),
                title: Text('Ameen',
                    style: TextStyle(color: primaryOrange, fontSize: 12)),
                subtitle: Text('Hello',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white)),
              ),
              const ListTile(
                leading: CircleAvatar(),
                title: Text('Ameen',
                    style: TextStyle(color: primaryOrange, fontSize: 12)),
                subtitle: Text('Hello',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white)),
              ),
              const ListTile(
                leading: CircleAvatar(),
                title: Text('Ameen',
                    style: TextStyle(color: primaryOrange, fontSize: 12)),
                subtitle: Text('Hello',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.grey[350],
                      hintText: 'Type Something',
                      filled: true),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
