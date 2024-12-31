import 'package:flutter_bloc/flutter_bloc.dart';
import 'form_event.dart';
import 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormsState> {
  FormBloc() : super(FormsState()) {
    on<FormFieldChanged>(_onFormFieldChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onFormFieldChanged(FormFieldChanged event, Emitter<FormsState> emit) {
    emit(state.copyWith(
      name: event.name,
      email: event.email,
      phone: event.phone,
      gender: event.gender,
      country: event.country,
      state: event.state,
      city: event.city,
      isFormValid: _validateForm(state),
    ));
  }

  void _onFormSubmitted(FormSubmitted event, Emitter<FormsState> emit) {
    final isValid = _validateForm(state);
    emit(state.copyWith(isFormValid: isValid));
  }

  bool _validateForm(FormsState state) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    final phoneRegex = RegExp(r'^\d{10}$');
    return state.name.isNotEmpty &&
        emailRegex.hasMatch(state.email) &&
        phoneRegex.hasMatch(state.phone) &&
        state.gender.isNotEmpty &&
        state.country.isNotEmpty &&
        state.state.isNotEmpty &&
        state.city.isNotEmpty;
  }
}
