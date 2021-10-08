import 'package:flutter/material.dart';

class DailySubjectWidget extends StatelessWidget {
  final String subjectOfTheDay;

  const DailySubjectWidget({
    Key? key,
    required this.subjectOfTheDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 5),
      margin: const EdgeInsets.only(top: 7),
      color: const Color(0xff20b3c5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '➞ Тема дня',
                style: TextStyle(color: Colors.white70),
              ),
              Icon(
                Icons.clear,
                color: Colors.white,
              )
            ],
          ),
          const SizedBox(height: 15),
          Text(
            subjectOfTheDay,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
