import 'package:github_search/data/local/model/repo_db.dart';
import 'package:github_search/domain/model/repo.dart';

class RepoListLocalMapper {
  static Stream<List<Repo>> fromLocalStorage(Stream<List<RepoDb>> repoListDbAsync) {
    return repoListDbAsync.map(_trans);
  }

  static List<Repo> _trans(List<RepoDb> listRepoDb) {
    return listRepoDb.map(_transformRepo).toList();
  }

  static Repo _transformRepo(RepoDb repoDb) {
    return Repo(
      id: repoDb.requestId,
      description: repoDb.description,
      name: repoDb.name,
      owner: repoDb.owner,
      htmlUrl: repoDb.htmlUrl,
      watchersCount: repoDb.watchersCount,
      language: repoDb.language,
    );
  }
}
