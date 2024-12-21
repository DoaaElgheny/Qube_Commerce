import 'dart:developer';

import 'package:flutter/material.dart';

typedef ItemBuilder<T> = Widget Function(BuildContext context, T item);
typedef LoadMoreCallback<T> = Future<List<T>> Function();

class PaginatedWidget<T> extends StatefulWidget {
  const PaginatedWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.loadMore,
    this.crossAxisCount = 1,
    this.loadingIndicator,
    this.emptyState,
  });

  final List<T> items;
  final ItemBuilder<T> itemBuilder;
  final LoadMoreCallback<T> loadMore;
  final int crossAxisCount;
  final Widget? loadingIndicator;
  final Widget? emptyState;

  @override
  State<PaginatedWidget<T>> createState() => _PaginatedWidgetState<T>();
}

class _PaginatedWidgetState<T> extends State<PaginatedWidget<T>> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      final newItems = await widget.loadMore();
      if (newItems.isNotEmpty) {
        setState(() {
          widget.items.addAll(newItems);
        });
      }
    } catch (e) {
      log('Error loading more items: $e');
    } finally {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return widget.emptyState ??
          const Center(child: Text('No items available.'));
    }

    return ListView.builder(
      shrinkWrap: true,
      controller: _scrollController,
      // padding: widget.padding,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.items.length + (_isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < widget.items.length) {
          return widget.itemBuilder(context, widget.items[index]);
        } else {
          return widget.loadingIndicator ??
              const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
