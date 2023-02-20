import 'package:flutter/material.dart';
import 'package:github_search/config/app_color.dart';
import 'package:github_search/domain/model/repo.dart';
import 'package:github_search/domain/state/favorite_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteWidget extends ConsumerWidget {
  final Repo repo;

  const FavoriteWidget(this.repo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteState = ref.watch(favoriteProvider(repo.id));
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onChangeFavoriteState(ref),
      child: Icon(
        favoriteState ? Icons.favorite : Icons.favorite_border,
        color: AppColors.red,
        size: 24,
      ),
    );
  }

  void _onChangeFavoriteState(WidgetRef ref) {
    ref.read(favoriteProvider(repo.id).notifier).favoriteStatusChange(repo);
  }
}
