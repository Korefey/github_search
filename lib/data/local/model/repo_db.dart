import 'package:objectbox/objectbox.dart';

@Entity()
class RepoDb {
  @Id()
  int id;
  int requestId;
  String name;
  String owner;
  String description;
  String htmlUrl;
  int watchersCount;
  String language;

  RepoDb(
      {this.id = 0,
      required this.requestId,
      required this.name,
      required this.owner,
      required this.description,
      required this.htmlUrl,
      required this.watchersCount,
      required this.language});
}
