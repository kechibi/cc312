class Contact {
  String name;
  String email;

  Contact(this.name, this.email);

  @override
  String toString() => '$name (Email: $email)';
}