import 'dart:io';

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phonePrefix;
  final String phone;
  final String username;
  final File?  picture;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phonePrefix,
    required this.phone,
    required this.username,
    this.picture,

  });
}
