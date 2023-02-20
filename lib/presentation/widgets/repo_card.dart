import 'package:flutter/material.dart';
import 'package:github_search/config/app_color.dart';
import 'package:github_search/config/app_decorations.dart';
import 'package:github_search/config/app_text_style.dart';
import 'package:github_search/domain/model/repo.dart';
import 'package:github_search/presentation/widgets/favorite.dart';

class RepoCard extends StatelessWidget {
  final Repo repo;

  const RepoCard({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 8),
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDecorations.borderRadius,
      ),
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
              child: FavoriteWidget(repo),
            ),
          ),
        ],
      ),
    );
  }
}
