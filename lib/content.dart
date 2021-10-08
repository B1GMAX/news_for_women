class Content {
  final String title;
  final String someText;
  final String? image;
  final bool isFavorite;
  final String name;
  final String date1;
  final String date2;
  final int numberLikes;
  final int numberComments;
  final String postDate;

  Content({
    required this.title,
    required this.someText,
    this.image,
    required this.isFavorite,
    required this.name,
    required this.numberLikes,
    required this.numberComments,
    required this.date1,
    required this.date2,
    required this.postDate,
  });
}
