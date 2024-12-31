import 'package:equatable/equatable.dart';

class FormsState extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String country;
  final String state;
  final String city;
  final bool isFormValid;

  const FormsState({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.gender = '',
    this.country = '',
    this.state = '',
    this.city = '',
    this.isFormValid = false,
  });

  FormsState copyWith({
    String? name,
    String? email,
    String? phone,
    String? gender,
    String? country,
    String? state,
    String? city,
    bool? isFormValid,
  }) {
    return FormsState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object> get props => [name, email, phone, gender, country, state, city, isFormValid];
}
