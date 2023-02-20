import 'package:flutter/material.dart';
import 'package:github_search/config/app_color.dart';
import 'package:github_search/domain/state/favorite_stream_provider.dart';
import 'package:github_search/presentation/widgets/favorite_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteList extends ConsumerWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteList = ref.watch(favoriteStreamProvider);
    return favoriteList.maybeWhen(
      data: (data) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, i) {
                    return Padding(
                      key: ValueKey('${data[i].id} ${data[i].name}'),
                      padding: const EdgeInsets.all(8),
                      child: FavoriteCard(repo: data[i]),
                    );
                  },
                  childCount: data.length,
                ),
              )
            ],
          ),
        );
      },
      orElse: () {
        return const SizedBox.shrink();
      },
    );
  }
}
