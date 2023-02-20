import 'package:github_search/data/local/model/repo_db.dart';
import 'package:github_search/objectbox.g.dart';

class ObjectBox {
  late final Store store;

  late final Box<RepoDb> repoDbBox;

  ObjectBox._create(this.store) {
    repoDbBox = Box<RepoDb>(store);
  }

  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }

  void addRepoDb(int id, String name, String owner, String description, String htmlUrl, int watchersCount, String language) {
    RepoDb newRepoDb = RepoDb(
        requestId: id,
        name: name,
        owner: owner,
        description: description,
        htmlUrl: htmlUrl,
        watchersCount: watchersCount,
        language: language);
    repoDbBox.put(newRepoDb);
  }

  Stream<List<RepoDb>> getRepoDb() {
    final builder = repoDbBox.query();
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  void removeRepoDb(int repoId) {
    Query<RepoDb> query = repoDbBox.query(RepoDb_.requestId.equals(repoId)).build();
    List<RepoDb> repoDbList = query.find();
    repoDbBox.remove(repoDbList.first.id);
    query.close();
  }

  bool findRepoDb(int repoId) {
    Query<RepoDb> query = repoDbBox.query(RepoDb_.requestId.equals(repoId)).build();
    List<RepoDb> repoDbList = query.find();
    query.close();
    return (repoDbList.isEmpty) ? false : true;
  }
}
