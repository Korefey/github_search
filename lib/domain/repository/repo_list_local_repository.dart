import 'package:github_search/domain/model/repo.dart';

abstract class RepoListLocalRepository {
  Stream<List<Repo>> getStreamRepoList();

  void removeItemFromLocalDb(int repoId);
}
