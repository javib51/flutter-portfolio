import 'package:flutter/material.dart';
import 'package:portfolio/pages/home/components/about.dart';
import 'package:portfolio/pages/home/components/experience.dart';
import 'package:portfolio/pages/home/components/intro.dart';
import 'package:portfolio/utils/globals.dart';
import 'components/education.dart';
import 'components/footer.dart';
import 'components/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: const Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: HeaderList(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Header(),
                  SizedBox(height: 50),
                  Intro(),
                  SizedBox(height: 100),
                  About(),
                  SizedBox(height: 100),
                  Education(),
                  SizedBox(height: 20),
                  Experience(),
                  SizedBox(height: 120),
                  Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
