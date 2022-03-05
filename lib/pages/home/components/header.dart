import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderItem {
  final String title;
  final VoidCallback onTap;
  final bool isButton;

  HeaderItem({
    required this.title,
    required this.onTap,
    this.isButton = false,
  });
}

List<HeaderItem> headerItems = [
  HeaderItem(title: "About", onTap: () {}),
  HeaderItem(title: "Education", onTap: () {}),
  HeaderItem(title: "Experience", onTap: () {}),
  HeaderItem(title: "Projects", onTap: () {}),
  HeaderItem(title: "Contact", onTap: () {}),
];

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextButton(
                          onPressed: item.onTap,
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white60,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: const EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: item.onTap,
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}

class HeaderList extends StatelessWidget {
  const HeaderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return headerItems[index].isButton
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    color: kDangerColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                  ),
                  child: TextButton(
                    onPressed: headerItems[index].onTap,
                    child: Text(
                      headerItems[index].title,
                      style: const TextStyle(
                        color:  Colors.white60,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : ListTile(
                title: Text(
                  headerItems[index].title,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),
              );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10.0,
        );
      },
      itemCount: headerItems.length,
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: buildHeader(),
      ),
      // We will make this in a bit
      mobile: buildMobileHeader(),
      tablet: buildHeader(),
    );
  }

  // mobile header
  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HexagonWidget.flat(
              width: 60,
              color: const Color(0xff86949c),
              padding: 4.0,
              child: const Center(
                child: Text(
                  'JB',
                  style: TextStyle(
                    color: Color(0xffdbdbdb),
                    fontSize: 17,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
            // Restart server to make icons work
            // Lets make a scaffold key and create a drawer
            GestureDetector(
              onTap: () {
                log("Open the menu");
                // Lets open drawer using global key
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(
                Icons.menu,
                color: Color(0xff86949c),
                size: 45.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HexagonWidget.flat(
            width: 60,
            color: const Color(0xff86949c),
            padding: 4.0,
            child: const Center(
              child: Text(
                'JB',
                style: TextStyle(
                  color: Color(0xffdbdbdb),
                  fontSize: 17,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          const HeaderRow(),
        ],
      ),
    );
  }
}
