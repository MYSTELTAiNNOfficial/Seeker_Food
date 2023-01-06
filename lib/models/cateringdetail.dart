import 'package:equatable/equatable.dart';

class CateringDetail extends Equatable {
  final String? id;
  final String? name;
  final String? location;
  final String? phone;
  final String? open;
  final String? photo;

  const CateringDetail({
    this.id,
    this.name,
    this.location,
    this.phone,
    this.open,
    this.photo,
  });

  factory CateringDetail.fromJson(Map<String, dynamic> json) => CateringDetail(
        id: json['id'] as String?,
        name: json['name'] as String?,
        location: json['location'] as String?,
        phone: json['phone'] as String?,
        open: json['open'] as String?,
        photo: json['photo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'location': location,
        'phone': phone,
        'open': open,
        'photo': photo,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, location, phone, open, photo];
}
