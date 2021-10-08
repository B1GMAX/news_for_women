import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_for_women/daily_subject_widget.dart';

import 'content.dart';

class NewsTabBody extends StatelessWidget {
  final Stream<List<Content>> contentStream;
  final String? subjectOfTheDay;

  const NewsTabBody({
    Key? key,
    required this.contentStream,
    this.subjectOfTheDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (subjectOfTheDay != null)
          DailySubjectWidget(subjectOfTheDay: subjectOfTheDay!),
        Expanded(
          child: StreamBuilder<List<Content>>(
            initialData: const [],
            stream: contentStream,
            builder: (context, snapshot) {
              final content = snapshot.data!;
              return ListView.builder(
                itemCount: content.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 285,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 10, color: Colors.grey[300]),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/female.png',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                content[index].name,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.pinkAccent,
                                ),
                                child: Center(
                                  child: Text(
                                    content[index].date1,
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff20b3c5),
                                ),
                                child: Center(
                                  child: Text(
                                    content[index].date2,
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 17),
                        if (content[index].image == null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                content[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 18),
                              ),
                            ),
                          ),
                        content[index].image == null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  content[index].someText,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            : Image.network(
                                content[index].image!,
                                height: 140,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(content[index].postDate,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                              const Text('➞ От рождения до года',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Divider(),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: _BottomActionsWidget(
                              likes: content[index].numberLikes,
                              comments: content[index].numberComments,
                              favorite: content[index].isFavorite,
                            )),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BottomActionsWidget extends StatelessWidget {
  final int likes;
  final int comments;
  final bool favorite;

  const _BottomActionsWidget(
      {Key? key,
      required this.likes,
      required this.comments,
      required this.favorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.favorite_border,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          likes.toString(),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.chat_bubble_outline,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          comments.toString(),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          Icons.share_outlined,
          color: Colors.grey,
        ),
        const Spacer(),
        favorite
            ? const Icon(
                Icons.star,
                color: Color(0xFFFB5A00),
              )
            : const Icon(
                Icons.star_border,
                color: Colors.grey,
              ),
      ],
    );
  }
}
