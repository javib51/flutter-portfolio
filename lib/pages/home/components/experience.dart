import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/screen_helper.dart';

class ExperienceEntry {
  final String company;
  final String position;
  final String date;
  final List description;

  ExperienceEntry({
    required this.company,
    required this.position,
    required this.date,
    required this.description,
  });
}

List<ExperienceEntry> educationsItems = [
  ExperienceEntry(
      company: "Kry",
      position: "Software Engineer",
      date: "August 2018 - December 2021",
      description: List.of([
        "Learning DevOps principles.",
        "Learning Terraform and Ansible.",
      ])),
  ExperienceEntry(
      company: "Eficode",
      position: "Thesis Worker",
      date: "November 2019 - August 2020",
      description: List.of([
        "Learning DevOps principles.",
        "Learning Terraform and Ansible.",
        "I worked on my master thesis. It researches the possibility of achieving continuous delivery and continuous deployment of database schema migration in systems with a zero-downtime requirement."
      ])),
  ExperienceEntry(
      company: "Trukatu",
      position: "CTO & Cofounder",
      date: "January 2019 - February 2020",
      description: List.of([
        "Business research and development were my mainly duties during the first 6 months.",
        "Sporadically pitching.",
        "Designed the system architecture taking in account the team skills, scaling expectations and resource limitations.",
        "Main frontend/backend developer and managing the whole system development cycle.",
        "Used a bunch of different technologies (Flutter, Firebase, Flask, Quarkus, Google Cloud, Algolia, etc)."
      ])),
  ExperienceEntry(
      company: "Aalto University",
      position: "Teacher Assistant",
      date: "October 2018 - March 2019",
      description: List.of([
        "I took part of the Web Software Development course stuff.",
        "I held tutoring and Q&A sessions.",
        "Designed the system architecture taking in account the team skills, scaling expectations and resource limitations.",
        "The course was focus on teaching basic web development (Python Django, basic HTML/CSS/JS deployed at Heroku)."
      ])),
  ExperienceEntry(
      company: "Vipera",
      position: "Software Engineer",
      date: "October 2017 - August 2018",
      description: List.of([
        "I was involved in the startup of the MOTIF department in the Spanish division. I became technical head in the Spanish division after some months, taking technical decisions about related projects.",
        "Participated in multiple projects as Tech Lead.",
        "Unexpected twelve-factor app evangelist.",
        "Architected and developed multiple projects such as Motif Card Controller (Coorporate Controller and SME 360) or Santander Onepay with some great people.",
        "Helped in mantain some of the MOTIF's components such as Visa, Mastercard card control integrations or a notification plugin.",
        "I ended up my journey here creating a video course on how MOTIF works and how to use it in depth.",
      ])),
  ExperienceEntry(
      company: "Intelligence Partner",
      position: "Software Developer Intern",
      date: "October 2016 - May 2017",
      description: List.of([
        "I was at IPLabs department mainly working in Task4Work in automatic testing.",
        "During my time at the company, I got certified as Google Cloud Developer and experience in App engine development using Python."
      ])),
];

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  int _selectedIndex = 0;

  Widget _buildTabBarItem(String title, {bool? selected}) {
    return Row(
      children: [
        Container(
          margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
          height: 5.0,
          color: Colors.black,
        ),
        Text(
          title,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar(List<ExperienceEntry> entries) {
    return Container(
      width: 218,
      child: NavigationRail(
        backgroundColor: Colors.transparent,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        labelType: NavigationRailLabelType.selected,
        destinations: entries
            .map((entry) => NavigationRailDestination(
                  icon: _buildTabBarItem(entry.company),
                  selectedIcon: _buildTabBarItem(entry.company),
                  label: Container(),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildTabView(List<ExperienceEntry> entries) {
    final entry = entries.elementAt(_selectedIndex);
    return Container(
      constraints: BoxConstraints(minWidth: 200, maxWidth: 750),
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${entry.position}@${entry.company}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            entry.date,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(
            height: 18,
          ),
          ...entry.description
              .map((e) => Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 15,
                          height: 15,
                          child: Image.asset('assets/dot.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          constraints:
                              BoxConstraints(minWidth: 200, maxWidth: 500),
                          child: Text(
                            e,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget buildDesktop(BuildContext context, List<ExperienceEntry> entries) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 200,
        maxHeight: 400,
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          _buildTabBar(entries),
          _buildTabView(entries),
        ],
      ),
    );
  }

  Widget _buildMobileTab(List<ExperienceEntry> entries) {
    final entry = entries.elementAt(_selectedIndex);
    return Container(
      constraints: BoxConstraints(minWidth: 200, maxWidth: 750),
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${entry.position}@${entry.company}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            entry.date,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(
            height: 18,
          ),
          ...entry.description
              .map((e) => Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 15,
                          height: 15,
                          child: Image.asset('assets/dot.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          constraints:
                              BoxConstraints(minWidth: 200, maxWidth: 300),
                          child: Text(
                            e,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget buildMobile(BuildContext context, List<ExperienceEntry> entries) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 218,
            child: NavigationRail(
              backgroundColor: Colors.transparent,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.selected,
              destinations: entries
                  .map((entry) => NavigationRailDestination(
                        icon: _buildTabBarItem(entry.company),
                        selectedIcon: _buildTabBarItem(entry.company),
                        label: Container(),
                      ))
                  .toList(),
            ),
          ),
          _buildMobileTab(entries),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 200,
        maxWidth: 1000,
        minHeight: 200,
        maxHeight: ScreenHelper.getSizeBasedOnWidth(context,
            desktop: educationsItems.length * 320,
            tablet: educationsItems.length * 250,
            mobile: educationsItems.length * 250),
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "EXPERIENCE",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ScreenHelper(
            desktop: buildDesktop(context, educationsItems),
            tablet: buildDesktop(context, educationsItems),
            mobile: buildDesktop(context, educationsItems),
          ),
        ],
      ),
    );
  }
}
