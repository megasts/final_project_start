

import 'address.dart';
import 'company.dart';


class User {
  final int userId;
  final String name;
  final String username;
  final Address address;
  final String email;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.userId,
    required this.name,
    required this.username,
    required this.address,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'],
      name: json['name'],
      username:json['username'],
      address:Address.fromJson(json["address"]),
      email: json['email'],
      phone:json['phone'],
      website:json['website'],
      company:Company.fromJson(json["company"]),
    );

  }
}

