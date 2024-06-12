import 'package:troismconsulting/models/Role.dart';
import 'package:troismconsulting/models/User.dart';

class Account{

  final String id;
  final String username;
  final String password;
  final bool verified;
  final bool blocked;
  final String verificationCode;
  final String createdDate;
  final Role role;
  final User user;


  Account({
    required this.id,
    required this.username,
    required this.password,
    required this.verified,
    required this.blocked,
    required this.verificationCode,
    required this.createdDate,
    required this.role,
    required this.user
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        id: json['id'],
        username: json['username'],
        password: json['password'],
        verified: json['verified'],
        blocked: json['blocked'],
        verificationCode: json['verificationCode'],
        createdDate: json['created'],
        role: json['role'],
        user: json['user']
    );


  }
}