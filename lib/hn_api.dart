import 'dart:convert';

import 'package:http/http.dart' as http;

enum Type { newest, top }

extension on Type {
  Uri get uri {
    switch (this) {
      case Type.newest:
        return Uri.parse(
            'https://hacker-news.firebaseio.com/v0/newstories.json');

      case Type.top:
        return Uri.parse(
            'https://hacker-news.firebaseio.com/v0/topstories.json');
    }
  }
}

class FeedItem {
  final int score;
  final String title;
  final String? url;
  final String author;

  const FeedItem({
    required this.score,
    required this.title,
    this.url,
    required this.author,
  });

  @override
  String toString() => '$author: $title($score⭐️), ${url ?? 'no-url'}';
}

class NHApi {
  Future<List<FeedItem>> newest() async {
    final ids = await _getItems(Type.newest);
    final items = await Future.wait(ids.map((id) => _getItem(id)));

    return items.toList(growable: false);
  }

  Future<List<FeedItem>> top() async {
    final ids = await _getItems(Type.top);
    final items = await Future.wait(ids.map((id) => _getItem(id)));
    print('loaded top ${items}');
    return items.toList(growable: false);
  }

  Future<FeedItem> _getItem(int id) async {
    final response = await http
        .get(Uri.parse('https://hacker-news.firebaseio.com/v0/item/$id.json'));


    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return FeedItem(
        score: json['score'],
        title: json['title'],
        author: json['by'],
        url: json['url']);
  }

  Future<List<int>> _getItems(Type type, {int count = 25}) async {
    final responce = await http.get(type.uri);

    final ids = (jsonDecode(responce.body) as List)
        .take(count)
        .map((e) => e as int)
        .toList(growable: false);

    return ids;
  }
}
