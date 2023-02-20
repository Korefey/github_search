import 'package:github_search/domain/model/repo.dart';

class RepoList {
  final List<Repo> list;

  RepoList({required this.list});

  RepoList.empty(this.list);
}
