import 'package:flutter/material.dart';
import 'package:portfolio/utils/screen_helper.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  Widget _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Hi, my name is",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Javier Benitez",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "I design and build cloud systems.",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildProfilePic() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0), //or 15.0
      child: Container(
        height: 230.0,
        width: 344.0,
        color: Colors.transparent,
        child: Image.asset('assets/me.jpg', fit: BoxFit.cover),
      ),
    );
  }

  Widget buildMobileHeader() {
    return Column(
      children: [
        _buildColumn(),
        const SizedBox(
          height: 70,
        ),
        _buildProfilePic(),
      ],
    );
  }

  Widget buildHeader() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildColumn(),
          const SizedBox(
            width: 119,
          ),
          _buildProfilePic(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      mobile: buildMobileHeader(),
      tablet: buildMobileHeader(),
      desktop: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 100),
        child: buildHeader(),
      ),
    );
  }
}
