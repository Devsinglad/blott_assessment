import 'package:intl/intl.dart';

class NewsModel {
  final String? category;
  final int? datetime;
  final String? headline;
  final String? image;
  final String? source;
  final String? summary;
  final String? url;

  NewsModel({
    this.category,
    this.datetime,
    this.headline,
    this.image,
    this.source,
    this.summary,
    this.url,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      category: json['category'],
      datetime: json['datetime'],
      headline: json['headline'],
      image: json['image'],
      source: json['source'],
      summary: json['summary'],
      url: json['url'],
    );
  }

  String getFormattedDate() {
    if (datetime != null) {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(datetime! * 1000);
      return DateFormat('dd MMM yyyy')
          .format(dateTime); // Customize the format as needed
    } else {
      return 'No Date Available';
    }
  }
}
