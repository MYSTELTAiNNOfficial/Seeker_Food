import 'package:equatable/equatable.dart';

class DataUser extends Equatable {
  final String? name;
  final String? email;
  final String? phone;

  const DataUser({this.name, this.email, this.phone});

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, email, phone];
}
