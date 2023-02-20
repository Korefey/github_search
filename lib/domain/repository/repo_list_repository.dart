import 'package:github_search/domain/model/repo_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class RepoListRepository {
  Future<AsyncValue<RepoList>> getRepoList({String page, String perPage});
}
