import 'package:riverpod/riverpod.dart';
import 'contact_service.dart';
import 'contact.dart';
import 'main.dart';

final contactServiceProvider = Provider<ContactService>((ref) {
  return ContactService();
});