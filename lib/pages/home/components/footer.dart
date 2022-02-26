import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:footer/footer.dart' as footerlib;

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return footerlib.Footer(
      child:
          const Text('Original Portfolio Designed & Built by Javier Benitez'),
      padding: const EdgeInsets.all(10.0),
      backgroundColor: Colors.transparent,
    );
  }

  Future<int> getRepoCounts() async {
    int count = 0;
    var client = http.Client();
    try {
      var response = await client.get(
          Uri.https('api.github.com', 'repos/javib51/flutter-portfolio'),);
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      count = decodedResponse["stargazers_count"];
    } finally {
      client.close();
    }
    return count;
  }
}
