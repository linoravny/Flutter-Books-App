class Post {
  final int userId;
  final int id;
  final String appId;
  final String title;
  final String body;
  final bool isAdded;

  Post({
    this.userId,
    this.id,
    this.appId,
    this.title,
    this.body,
    this.isAdded,
  });
  factory Post.fromJson(dynamic json) {
    return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      appId: json['appId'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
