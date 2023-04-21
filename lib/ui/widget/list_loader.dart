import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ListLoader extends StatelessWidget {
  final Widget child;
  final RefreshController controller;
  final Future<dynamic>? Function()? onRefresh;
  final Future<dynamic>? Function()? onLoadMore;
  final bool hasNext;

  const ListLoader({
    Key? key,
    required this.child,
    required this.controller,
    this.hasNext = false,
    this.onRefresh,
    this.onLoadMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => const ClassicHeader(),
      footerBuilder: () => const ClassicFooter(),
      child: SmartRefresher(
        controller: controller,
        onLoading: _loadMore,
        onRefresh: _refresh,
        enablePullUp: hasNext && onLoadMore != null,
        enablePullDown: onRefresh != null,
        child: child,
      ),
    );
  }

  Future<void> _loadMore() async {
    if (controller.isRefresh) return;
    onLoadMore?.call()?.then(
          (_) => controller.loadComplete(),
          onError: (_) => controller.loadFailed(),
        );
  }

  Future<void> _refresh() async {
    if (controller.isLoading) {
      controller.loadComplete();
    }

    onRefresh?.call()?.then(
          (_) => controller.refreshCompleted(),
          onError: (_) => controller.refreshFailed(),
        );
  }
}
