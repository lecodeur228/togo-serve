import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:togoserve/constants.dart';
import 'package:togoserve/utils/screen_size.dart';
import 'package:togoserve/utils/text_size.dart';
import 'package:togoserve/views/screens/place_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:heroicons/heroicons.dart';
import 'package:togoserve/views/widgets/article_widget.dart';
import 'package:togoserve/views/widgets/place_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.heightPercent(1),
            vertical: context.widthPercent(2)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.heightPercent(2),
              ),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(width: context.widthPercent(2)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("current position",
                          style: TextStyle(
                              color: Colors.black87, fontSize: context.p2)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Constants.primaryColor,
                            ),
                            Text(
                              "Lomé, Togo",
                              style: TextStyle(
                                  color: Colors.black, fontSize: context.p3),
                            )
                          ])
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(context.heightPercent(1)),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 0.5,
                            color: Colors.black87.withOpacity(0.5))),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.heightPercent(2),
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    labelText: "Search place",
                    labelStyle:
                        TextStyle(color: Colors.black87, fontSize: context.p2),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black87.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(12))),
              ),
              SizedBox(
                height: context.heightPercent(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Few places",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: context.t4,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text("See all"))
                ],
              ),
              SizedBox(
                height: context.heightPercent(32),
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return PlaceWidget(isLiked: isLiked);
                  },
                ),
              ),
              SizedBox(
                height: context.heightPercent(1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Few Articles",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: context.t4,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text("See all")),
                ],
              ),
              SizedBox(
                height: context.heightPercent(30),
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const ArticleWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
            horizontal: context.widthPercent(3),
            vertical: context.heightPercent(1)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Constants.primaryColor,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black87,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.business,
                  text: 'Places',
                ),
                GButton(
                  icon: Icons.map_outlined,
                  text: 'Carte',
                ),
                GButton(
                  icon: Icons.shopping_bag_outlined,
                  text: 'Articles',
                ),
              ],
              // selectedIndex: _selectedIndex,
              // onTabChange: (index) {
              //   setState(() {
              //     _selectedIndex = index;
              //   });
              // },
            ),
          ),
        ),
      ),
    );
  }
}
