import 'package:flutter/material.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_grid/responsive_grid.dart';

class EducationEntry {
  final String title;
  final String date;
  final String description;
  final String link;

  EducationEntry(
      {required this.title,
      required this.date,
      required this.description,
      required this.link});
}

List<EducationEntry> educationsItems = [
  EducationEntry(
      title: "EIT Digital Academy",
      date: "August 2018 - December 2021",
      description:
          "I studied a master degree in Cloud Computing and Services with minor in Entrepreneurship and innovation.",
      link: "eit.europa.eu"),
  EducationEntry(
      title: "EIT Digital Academy",
      date: "August 2018 - December 2021",
      description:
          "I studied a master degree in Cloud Computing and Services with minor in Entrepreneurship and innovation.",
      link: "eit.europa.eu"),
  EducationEntry(
      title: "EIT Digital Academy",
      date: "August 2018 - December 2021",
      description:
          "I studied a master degree in Cloud Computing and Services with minor in Entrepreneurship and innovation.",
      link: "eit.europa.eu"),
  EducationEntry(
      title: "EIT Digital Academy",
      date: "August 2018 - December 2021",
      description:
          "I studied a master degree in Cloud Computing and Services with minor in Entrepreneurship and innovation.",
      link: "eit.europa.eu"),
];

class Education extends StatelessWidget {
  const Education({Key? key}) : super(key: key);

  Widget buildEducationBlock(EducationEntry entry) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 50, bottom: 50),
      alignment: const Alignment(0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entry.title,
            style: const TextStyle(
              fontSize: 24,
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
          Text(
            entry.description,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            child: Text(
              entry.link,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
              ),
            ),
            onTap: () => launch('https://${entry.link}'),
          ),
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
            desktop: (educationsItems.length / 2).ceil() * 320,
            tablet: educationsItems.length * 250,
            mobile: educationsItems.length * 250),
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "EDUCATION",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: ResponsiveGridList(
              desiredItemWidth: 300,
              rowMainAxisAlignment: MainAxisAlignment.start,
              scroll: false,
              children: educationsItems
                  .map((entry) => buildEducationBlock(entry))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
