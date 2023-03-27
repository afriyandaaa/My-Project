import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp_ui/widget/PanggilanWidget.dart';
import '../widget/ChatsWidget.dart';
import '../widget/StatusWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "WhatsApp",
                style: TextStyle(fontSize: 21),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 12, right: 15),
                child: Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
              PopupMenuButton(
                elevation: 10,
                padding: EdgeInsets.symmetric(vertical: 20),
                iconSize: 28,
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Text(
                      "New Grup",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text(
                      "Siaran baru",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    child: Text(
                      "Perangkat tertaut",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 4,
                    child: Text(
                      "Pesan berbintang",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 5,
                    child: Text(
                      "Setelan",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Color(0xFF075E55),
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorWeight: 4,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  //tab 1
                  Container(
                    width: 24,
                    child: const Tab(
                      icon: Icon(Icons.camera_alt),
                    ),
                  ),
                  //Tab 2
                  Container(
                    width: 90,
                    child: Row(
                      children: [
                        const Text("Chats"),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "90",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF075E55),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //tab 3
                  Container(
                    width: 85,
                    child: const Tab(
                      child: Text("Status"),
                    ),
                  ),
                  //tab 4
                  Container(
                    width: 85,
                    child: const Tab(
                      child: Text("Panggilan"),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: TabBarView(
                children: [
                  // tab 1 Camera
                  Container(color: Colors.black),
                  // tab 2 ChatsWidget
                  ChatsWidget(),
                  // tab 3 StatusWidget
                  StatusWidget(),
                  // tab 4 PanggilanWidget
                  PanggilanWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
