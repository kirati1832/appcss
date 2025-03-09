import 'dart:convert';
import 'package:crypto/crypto.dart';

String hashPassword(String password) {
  var bytes = utf8.encode(password);
  var hashed = sha256.convert(bytes);
  return hashed.toString();
}