import 'contact_service.dart';
import 'contact.dart';
import 'main.dart';
import 'package:riverpod/riverpod.dart';


class ContactService {
  final List<Contact> _contacts = [];

  void addContact(String name, String email) {
    final newContact = Contact(name, email);
    _contacts.add(newContact);
    print('$name (Email: $email) has been added.');
  }

  void viewContacts() {
    if (_contacts.isEmpty) {
      print('No contacts available.');
    } else {
      _contacts.forEach((contact) => print(contact));
    }
  }

  void editContact(int index, String name, String email) {
    if (index >= 0 && index < _contacts.length) {
      _contacts[index] = Contact(name, email);
      print('Contact updated: ${_contacts[index]}');
    } else {
      print('Invalid index.');
    }
  }
}