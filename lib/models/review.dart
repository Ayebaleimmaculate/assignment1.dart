class Review {
  final String? author;
  final String? content;
  final String? createdAt;

  Review({this.author, this.content, this.createdAt});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        author: json['author'],
        content: json['content'],
        createdAt: json['created_at'],
      );
}
