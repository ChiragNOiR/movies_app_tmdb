class ReviewsModel {
  String? reviewerName;
  String? content;
  String? photo;
  double rating;

  ReviewsModel({
    required this.reviewerName,
    required this.content,
    required this.photo,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'rating': rating,
      'author': reviewerName,
      'content': content,
      'avatar_path': photo,
    };
  }

  factory ReviewsModel.fromJson(Map<String, dynamic> map) {
    final authorDetails = map['author_details'];
    final avatarPath = authorDetails['avatar_path'];
    return ReviewsModel(
      reviewerName: map['author'] ?? '',
      content: map['content'] ?? '',
      // photo: map['avatar_path'] ?? '',
      rating: map['author_details']['rating'].runtimeType == int
          ? map['author_details']['rating'].toDouble()
          : map['author_details']['rating'],
      photo: avatarPath == null
          ? ''
          : avatarPath.contains('http')
              ? avatarPath.substring(1)
              : "https://image.tmdb.org/t/p/w500$avatarPath",
    );
  }
}
