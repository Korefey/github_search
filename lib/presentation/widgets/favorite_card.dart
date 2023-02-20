import 'package:flutter/material.dart';
import 'package:github_search/config/app_color.dart';
import 'package:github_search/config/app_text_style.dart';
import 'package:github_search/domain/model/repo.dart';
import 'package:github_search/domain/state/favorite_list_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteCard extends ConsumerWidget {
  final Repo repo;

  const FavoriteCard({super.key, required this.repo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      key: ValueKey('${repo.id} ${repo.name}'),
      color: AppColors.white,
      padding: const EdgeInsets.only(left: 8, top: 8),
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name - ${repo.name}',
            style: AppTextStyles.caption2(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('Owner - ${repo.owner}', style: AppTextStyles.caption4(), maxLines: 1),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(bottom: 8, right: 8),
              child: GestureDetector(
                onTap: () => _removeCurrentCard(repo.id, ref),
                child: const Icon(
                  Icons.remove_shopping_cart,
                  color: AppColors.red,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _removeCurrentCard(int cardId, WidgetRef ref) async {
    ref.read(favoriteListProvider.notifier).removeItemFromFavoriteList(repo.id);
  }
}
