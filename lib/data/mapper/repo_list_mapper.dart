import 'package:github_search/data/api/model/api_repo_list.dart';
import 'package:github_search/domain/model/repo.dart';
import 'package:github_search/domain/model/repo_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepoListMapper {
  static AsyncValue<RepoList> fromApi(AsyncValue<ApiRepoList> repoListAsync) {
    RepoList repoList = RepoList.empty([]);
    for (var tempData in repoListAsync.value!.list) {
      var repoData = Repo.empty(
          tempData.id, tempData.name, tempData.owner, tempData.description, tempData.htmlUrl, tempData.watchersCount, tempData.language);
      repoList.list.add(repoData);
    }
    return AsyncValue<RepoList>.data(
      RepoList(
        list: repoList.list,
      ),
    );
  }
}
