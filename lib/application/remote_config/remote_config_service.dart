import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'remote_config_model.dart';

@injectable
class RemoteConfigService {
  final FirebaseDatabase _database;

  RemoteConfigService(this._database);
  Future<RemoteConfigModel> load() async {
    final snapshot = await _database.ref('settings').get();

    if (!snapshot.exists) {
      throw Exception('Remote config not found in Firebase.');
    }

    final data = Map<String, dynamic>.from(snapshot.value as Map);
    return RemoteConfigModel.fromJson(data);
  }
}

