class BlogModel {
  final String title;
  final String contents;
  final String img;
  final DateTime create_date;
  final String read_count;
  BlogModel(
      {required this.title,
      required this.contents,
      required this.img,
      required this.create_date,
      required this.read_count});
}
