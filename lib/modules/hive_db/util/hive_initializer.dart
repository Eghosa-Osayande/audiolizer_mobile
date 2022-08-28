import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:solpha/modules/hive_db/adapters/enum_adapter.dart';
import 'package:solpha/modules/hive_db/adapters/from_json_adapter.dart';
import 'package:solpha/modules/hive_db/adapters/linked_list_adapter.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/bar/bars_linked_list.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/score/key_signature.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/models/score/time_signature.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/os_path/services/path/platform_path_service.dart';

class HiveInitializer {
  static Future<void> init() async {
    if (kIsWeb) {
    } else {
      String path = await PlatformPathService.instance.getHiveDirectory();
      Hive.init(path);
    }

    // await Hive.deleteFromDisk();

    Hive.registerAdapter(
      LinkedListAdapter<Bar, BarsLinkedlist>(
        typeId: 1,
      ),
    );
    Hive.registerAdapter(
      FromJsonTypeAdapter(
        createObject: (json) => Score.fromJson(json),
        typeId: 2,
      ),
    );
    Hive.registerAdapter(
      FromJsonTypeAdapter(
        createObject: (json) => Track.fromJson(json),
        typeId: 3,
      ),
    );
    Hive.registerAdapter(
      FromJsonTypeAdapter(
        createObject: (json) => Bar.fromJson(json),
        typeId: 4,
      ),
    );
    Hive.registerAdapter(
      FromJsonTypeAdapter(
        createObject: (json) => MusicNote.fromJson(json),
        typeId: 5,
      ),
    );
    Hive.registerAdapter(
      FromJsonTypeAdapter(
        createObject: (json) => DurationNote.fromJson(json),
        typeId: 7,
      ),
    );
    Hive.registerAdapter(
      FromJsonTypeAdapter(
        createObject: (json) => ScoreConfigNote.fromJson(json),
        typeId: 8,
      ),
    );
    Hive.registerAdapter(
      FromJsonTypeAdapter(
        createObject: (json) => TrackConfigNote.fromJson(json),
        typeId: 9,
      ),
    );
    Hive.registerAdapter(
      FromJsonTypeAdapter(
        createObject: (json) => WhiteSpaceNote.fromJson(json),
        typeId: 10,
      ),
    );
    Hive.registerAdapter(
      EnumTypeAdapter(typeId: 11, values: KeySignature.values),
    );
    Hive.registerAdapter(
      EnumTypeAdapter(typeId: 12, values: TimeSignature.values),
    );
    Hive.registerAdapter(
      EnumTypeAdapter(typeId: 13, values: DurationMarker.values),
    );
    Hive.registerAdapter(
      EnumTypeAdapter(typeId: 14, values: Solfege.values),
    );
  }
}
