import 'package:bitsgap/connectivity_store.dart';
import 'package:bitsgap/hacker_news_store.dart';
import 'package:bitsgap/hn_api.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => Provider<ConnectivityStore>(
        create: (_) => ConnectivityStore(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Todos'),
          ),
          body: Placeholder(),
        ),
      );
}

class ConnectivityExapmle extends StatelessWidget {
  const ConnectivityExapmle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ConnectivityStore>(context);
    return ScaffoldMessenger(
      child: ReactionBuilder(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Connectivity'),
          ),
          body: const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
                'Turn your connection on/off for approximately 4 seconds to see the app respond to changes in your connection status.'),
          ),
        ),
        builder: (context) =>
            reaction((_) => store.connectivityStream.value, (result) {
          final messenger = ScaffoldMessenger.of(context);

          messenger.showSnackBar(
            SnackBar(
              content: Text(result == ConnectivityResult.none
                  ? 'You\'re offline'
                  : 'You\'re online using ${(result as ConnectivityResult).name}'),
            ),
          );
        }, delay: 3000),
      ),
    );
  }
}

class HackerNewsExample extends StatefulWidget {
  const HackerNewsExample({Key? key}) : super(key: key);

  @override
  State<HackerNewsExample> createState() => _HackerNewsExampleState();
}

class _HackerNewsExampleState extends State<HackerNewsExample>
    with SingleTickerProviderStateMixin {
  final HackerNewsStore store = HackerNewsStore();

  late TabController _tabController;
  final _tabs = [FeedType.latest, FeedType.top];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(_onTabChange);

    store.loadNews(_tabs.first);
    super.initState();
  }

  void _onTabChange() {
    print('load ${_tabs[_tabController.index]}');
    store.loadNews(_tabs[_tabController.index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News'),
        bottom: TabBar(
          tabs: const [
            Tab(text: 'Newest'),
            Tab(text: 'Top'),
          ],
          controller: _tabController,
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            FeedItemsView(store, FeedType.latest),
            FeedItemsView(store, FeedType.top),
          ],
        ),
      ),
    );
  }
}

class FeedItemsView extends StatelessWidget {
  const FeedItemsView(this.store, this.type, {super.key});

  final HackerNewsStore store;
  final FeedType type;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final future = type == FeedType.latest
          ? store.latestItemsFuture
          : store.topItemsFuture;

      if (future == null) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No data loaded'),
            ElevatedButton(
              onPressed: _refresh,
              child: Text('Tap to refresh'),
            )
          ],
        );
      }

      switch (future.status) {
        case FutureStatus.pending:
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Text('Loading items...'),
            ],
          );
        case FutureStatus.rejected:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Failed to load items.',
                style: TextStyle(color: Colors.deepOrange),
              ),
              ElevatedButton(
                onPressed: _refresh,
                child: const Text('Tap to try again'),
              ),
            ],
          );
        case FutureStatus.fulfilled:
          final List<FeedItem> items = future.result;
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (_, index) {
                final item = items[index];
                return ListTile(
                  leading: Text(
                    '${item.score}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  title: Text(
                    item.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('- ${item.author}'),
                  onTap: () => store.openUrl((item.url)),
                );
              },
            ),
          );
      }
    });
  }

  Future _refresh() =>
      (type == FeedType.latest) ? store.fetchLatest() : store.fetchTop();
}
