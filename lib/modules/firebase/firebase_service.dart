import 'package:audiolizer/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file/file.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audiolizer/modules/app_services_controller/services_config.dart';

class FirebaseService {
  static FirebaseService? _instance;

  FirebaseService._();

  factory FirebaseService._create() {
    _instance ??= (AppServicesConfig.isTest) ? FirebaseService._() : FirebaseService._();
    return _instance!;
  }

  static FirebaseService get instance => FirebaseService._create();

  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static late final FirebaseFirestore _firebaseFirestoreDB = FirebaseFirestore.instance;

  static late final FirebaseDatabase _firebaseDB = FirebaseDatabase.instance;

  FirebaseFirestore get firestoreDB => _firebaseFirestoreDB;
  FirebaseDatabase get firebaseDB => _firebaseDB;
}
