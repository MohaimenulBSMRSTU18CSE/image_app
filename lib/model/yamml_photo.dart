class PhotoYamml {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  PhotoYamml({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
  });

  factory PhotoYamml.formJson(Map<String, dynamic> json) {
    return PhotoYamml(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
    );
  }
}
