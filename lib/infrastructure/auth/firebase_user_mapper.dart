// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_ddd_app/domain/auth/user.dart' as u;
import 'package:notes_ddd_app/domain/core/value_objects.dart';

// ignore: deprecated_member_use
extension FirebaseUserDomainX on FirebaseUser {
  u.User toDomain() {
    return u.User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
