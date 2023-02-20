import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/local/model/repo_db.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1679326616427681922),
      name: 'RepoDb',
      lastPropertyId: const IdUid(8, 1680367790979067164),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(id: const IdUid(1, 5443813946706795983), name: 'id', type: 6, flags: 1),
        ModelProperty(id: const IdUid(2, 3051800289870751835), name: 'name', type: 9, flags: 0),
        ModelProperty(id: const IdUid(3, 6680064155960026946), name: 'owner', type: 9, flags: 0),
        ModelProperty(id: const IdUid(4, 17615070025217173), name: 'description', type: 9, flags: 0),
        ModelProperty(id: const IdUid(5, 1355078339690283741), name: 'htmlUrl', type: 9, flags: 0),
        ModelProperty(id: const IdUid(6, 379169592764505519), name: 'watchersCount', type: 6, flags: 0),
        ModelProperty(id: const IdUid(7, 996556400769544308), name: 'language', type: 9, flags: 0),
        ModelProperty(id: const IdUid(8, 1680367790979067164), name: 'requestId', type: 6, flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 1679326616427681922),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    RepoDb: EntityDefinition<RepoDb>(
        model: _entities[0],
        toOneRelations: (RepoDb object) => [],
        toManyRelations: (RepoDb object) => {},
        getId: (RepoDb object) => object.id,
        setId: (RepoDb object, int id) {
          object.id = id;
        },
        objectToFB: (RepoDb object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final ownerOffset = fbb.writeString(object.owner);
          final descriptionOffset = fbb.writeString(object.description);
          final htmlUrlOffset = fbb.writeString(object.htmlUrl);
          final languageOffset = fbb.writeString(object.language);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, ownerOffset);
          fbb.addOffset(3, descriptionOffset);
          fbb.addOffset(4, htmlUrlOffset);
          fbb.addInt64(5, object.watchersCount);
          fbb.addOffset(6, languageOffset);
          fbb.addInt64(7, object.requestId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = RepoDb(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              requestId: const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0),
              name: const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 6, ''),
              owner: const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 8, ''),
              description: const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 10, ''),
              htmlUrl: const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 12, ''),
              watchersCount: const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0),
              language: const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 16, ''));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [RepoDb] entity fields to define ObjectBox queries.
class RepoDb_ {
  /// see [RepoDb.id]
  static final id = QueryIntegerProperty<RepoDb>(_entities[0].properties[0]);

  /// see [RepoDb.name]
  static final name = QueryStringProperty<RepoDb>(_entities[0].properties[1]);

  /// see [RepoDb.owner]
  static final owner = QueryStringProperty<RepoDb>(_entities[0].properties[2]);

  /// see [RepoDb.description]
  static final description = QueryStringProperty<RepoDb>(_entities[0].properties[3]);

  /// see [RepoDb.htmlUrl]
  static final htmlUrl = QueryStringProperty<RepoDb>(_entities[0].properties[4]);

  /// see [RepoDb.watchersCount]
  static final watchersCount = QueryIntegerProperty<RepoDb>(_entities[0].properties[5]);

  /// see [RepoDb.language]
  static final language = QueryStringProperty<RepoDb>(_entities[0].properties[6]);

  /// see [RepoDb.requestId]
  static final requestId = QueryIntegerProperty<RepoDb>(_entities[0].properties[7]);
}
