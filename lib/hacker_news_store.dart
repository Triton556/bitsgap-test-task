import 'package:bitsgap/hn_api.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'hacker_news_store.g.dart';

enum FeedType { latest, top }

class HackerNewsStore = _HackerNewsStore with _$HackerNewsStore;

abstract class _HackerNewsStore with Store {
  final _hnApi = NHApi();

  @observable
  ObservableFuture<List<FeedItem>>? latestItemsFuture;

  @observable
  ObservableFuture<List<FeedItem>>? topItemsFuture;

  @action
  Future fetchLatest() => latestItemsFuture = ObservableFuture(_hnApi.newest());

  @action
  Future fetchTop() => topItemsFuture = ObservableFuture(_hnApi.top());

  void loadNews(FeedType type) {
    if (type == FeedType.latest && latestItemsFuture == null) {
      print('call fetchLatest');
      fetchLatest();
    } else if (type == FeedType.top && topItemsFuture == null) {
      print('call fetchTop');
      fetchTop();
    }
  }

  void openUrl(String? url) async {
    if (url != null) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }
}
