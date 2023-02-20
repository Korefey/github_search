import 'package:flutter/material.dart';
import 'package:github_search/config/app_color.dart';
import 'package:github_search/config/app_text_style.dart';
import 'package:github_search/domain/state/repo_list_provider.dart';
import 'package:github_search/domain/state/page_provider.dart';
import 'package:github_search/presentation/widgets/repo_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepoList extends ConsumerStatefulWidget {
  const RepoList({Key? key, int? page}) : super(key: key);

  @override
  RepoListState createState() => RepoListState();
}

class RepoListState extends ConsumerState<RepoList> {
  var _page = 0;
  final int _perPage = 5;

  @override
  void initState() {
    ref.read(repoListProvider.notifier).fetchRepoList(page: '0', perPage: '30');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final repoList = ref.watch(repoListProvider);
    ref.watch(pageProvider);
    return repoList.when(
      data: (data) {
        final dataToShow = data.list.sublist(
          (_page * _perPage),
          ((_page * _perPage) + _perPage),
        );
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(children: [
                  ElevatedButton(
                    onPressed: () => {
                      if (_page != 0) {ref.read(pageProvider.notifier).pageChange(_page -= 1)}
                    },
                    child: Text(
                      'Prev',
                      style: AppTextStyles.caption4(color: AppColors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => {
                      if (repoList.value!.list.isNotEmpty && _page < ((repoList.value!.list.length / _perPage) - 1))
                        {ref.read(pageProvider.notifier).pageChange(_page += 1)}
                    },
                    child: Text(
                      'Next',
                      style: AppTextStyles.caption4(color: AppColors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$_page ... $_perPage',
                    style: AppTextStyles.caption2(),
                  ),
                ]),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: dataToShow.length,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    key: Key('${dataToShow[index].id}'),
                    padding: const EdgeInsets.all(8),
                    child: RepoCard(
                      repo: dataToShow[index],
                    ),
                  );
                },
              )
            ]),
          ),
        );
      },
      error: (_, __) {
        return const Center(child: Text('Error'));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
