import 'package:github_search/data/api/model/api_repo.dart';
import 'package:github_search/domain/model/repo.dart';

class RepoMapper {
  static Repo fromApi(ApiRepo repo) {
    return Repo(
      id: repo.id,
      name: repo.name,
      owner: repo.owner,
      description: repo.description,
      htmlUrl: repo.htmlUrl,
      watchersCount: repo.watchersCount,
      language: repo.language,
    );
  }
}
