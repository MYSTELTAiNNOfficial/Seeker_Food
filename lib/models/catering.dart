import 'package:equatable/equatable.dart';

class Catering extends Equatable {
  final String? id;
  final String? name;
  final String? location;
  final String? photo;

  const Catering({this.id, this.name, this.location, this.photo});

  factory Catering.fromJson(Map<String, dynamic> json) => Catering(
        id: json['id'] as String?,
        name: json['name'] as String?,
        location: json['location'] as String?,
        photo: json['photo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'location': location,
        'photo': photo,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, location, photo];
}
