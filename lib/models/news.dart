import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  final String title;
  final String url;
  final Timestamp publishedDate;

  News({this.title, this.url, this.publishedDate});

  static News fromData(Map<String, dynamic> map) {
    if (map == null) return null;

    return News(
      title: map['title'],
      url: map['url'],
      publishedDate: map['publishedDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'publishedDate': publishedDate,
    };
  }
}
