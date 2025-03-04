class Posts {
  final String title;
  final String message;
  final String type;
  final String postDate;
  final String imgUrl;

  Posts({
    required this.title,
    required this.message,
    required this.type,
    required this.postDate,
    required this.imgUrl,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      title: json['Title'] ?? '',
      message: json['Message'] ?? '',
      type: json['type'] ?? '',
      postDate: json['PostDate'] ?? '',
      imgUrl: json['img_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Message': message,
      'type': type,
      'PostDate': postDate,
      'img_url': imgUrl,
    };
  }
}
