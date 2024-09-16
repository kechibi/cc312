import 'dart:io';
import 'package:prelimproject/contact_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'contact_service.dart';
import 'contact.dart';
import 'main.dart';

void main() {
  final container = ProviderContainer();
  final contactService = container.read(contactServiceProvider);

  while (true) {
    print('\nContact Management System');
    print('1. Add a contact');
    print('2. View all contacts');
    print('3. Edit a contact');
    print('4. Exit');
    print('Enter your choice:');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter the contact name:');
        String? name = stdin.readLineSync();
        print('Enter the contact email:');
        String? email = stdin.readLineSync();
        if (name != null && email != null && name.isNotEmpty && email.isNotEmpty) {
          contactService.addContact(name, email);
        } else {
          print('Invalid input. Please try again.');
        }
        break;

      case '2':
      contactService.viewContacts(); 
        break;

      case '3':
        print('Enter the index of the contact to edit:');
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index != null) {
          print('Enter the new contact name:');
          String? newName = stdin.readLineSync();
          print('Enter the new contact email:');
          String? newEmail = stdin.readLineSync();
          if (newName != null && newEmail != null && newName.isNotEmpty && newEmail.isNotEmpty) {
            contactService.editContact(index, newName, newEmail);
          } else {
            print('Invalid input. Please try again.');
          }
        } else {
          print('Invalid index. Please try again.');
        }
        break;

      case '4':
        print('Exiting the application...');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}