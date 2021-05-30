class ImageQuiz {
  final String title;
  final String description;


  ImageQuiz({
    this.title,
    this.description,
  });
  factory ImageQuiz.fromJson(Map<String, dynamic> json) {
    return ImageQuiz(
      title: json['title'],
      description: json['description'],
    );
  }
}
