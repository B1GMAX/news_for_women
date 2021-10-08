import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_for_women/bloc.dart';
import 'package:provider/provider.dart';

import 'news_tab_body.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<Bloc>(
      create: (BuildContext context) => Bloc()..loadData(),
      dispose: (context, bloc) => Bloc().dispose(),
      builder: (context, child) {
        return DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              actions: const [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                )
              ],
              leading: Container(
                margin: const EdgeInsets.all(10),
                height: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: const Color(0xff20b3c5),
                    child: const Icon(Icons.filter_list),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              bottom: const TabBar(
                labelColor: Colors.black,
                indicatorColor: Color(0xff20b3c5),
                indicatorWeight: 5,
                tabs: [
                  Tab(
                    text: 'Новые',
                  ),
                  Tab(
                    text: 'Популярные',
                  ),
                  Tab(
                    text: 'Подписки',
                  )
                ],
              ),
              title: const Text(
                'Новости',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: TabBarView(
              children: [
                NewsTabBody(
                  contentStream: context.read<Bloc>().streamNew,
                  subjectOfTheDay:
                      'А как вы с любимым ласково называете друг друга?',
                ),
                NewsTabBody(
                  contentStream: context.read<Bloc>().streamPopular,
                ),
                NewsTabBody(
                  contentStream: context.read<Bloc>().streamSubscribe,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
