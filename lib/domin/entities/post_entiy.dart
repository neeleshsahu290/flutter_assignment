class PostEntiy {
  final int userId;
  final int id;
  final String title;
  final String body;
  final bool isFavorite;

  const PostEntiy({
    required this.userId,
    required this.id,
    required this.body,
    required this.title,
    this.isFavorite = false,
  });
  PostEntiy copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
    bool? isFavorite,
  }) {
    return PostEntiy(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
