import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class FormFieldChanged extends FormEvent {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String country;
  final String state;
  final String city;

  const FormFieldChanged({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.country,
    required this.state,
    required this.city,
  });

  @override
  List<Object> get props => [name, email, phone, gender, country, state, city];
}

class FormSubmitted extends FormEvent {}
