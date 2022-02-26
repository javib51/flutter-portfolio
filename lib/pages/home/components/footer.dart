import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:footer/footer.dart' as footerlib;
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: getRepoCounts(), // a Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<int> result) {
        switch (result.connectionState) {
          case ConnectionState.none:
            return Container();
          case ConnectionState.waiting:
            return Container();
          default:
            if (result.hasError) {
              return Container();
            } else {
              return footerlib.Footer(
                child: InkWell(
                  child: Column(
                    children: [
                      const Text(
                          'Original Portfolio Designed & Built by Javier Benitez'),
                      Text('Github Stars ${result.data}',
                          textAlign: TextAlign.center),
                    ],
                  ),
                  onTap: () => launch(
                      'https://github.com/javib51/flutter-portfolio'),
                ),
                padding: const EdgeInsets.all(10.0),
                backgroundColor: Colors.transparent,
              );
            }
        }
      },
    );
  }

  Future<int> getRepoCounts() async {
    int count = 0;
    var client = http.Client();
    try {
      var response = await client
          .get(Uri.https('api.github.com', 'repos/javib51/flutter-portfolio'));
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      count = decodedResponse["stargazers_count"];
    } finally {
      client.close();
    }
    return count;
  }
}
