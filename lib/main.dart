import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form/form/bloc/form_bloc.dart';
import 'package:form/form/bloc/form_state.dart';
import 'package:form/form/bloc/form_event.dart';
import 'package:form/widgets/email_widget.dart';
import 'package:form/widgets/location_widget.dart';
import 'package:form/widgets/name_widget.dart';
import 'package:form/widgets/gender_widget.dart';
import 'package:form/widgets/phone_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => FormBloc(),
        child: MyForm(),
      ),
    );
  }
}

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form with BLoC'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<FormBloc, FormsState>(
            builder: (context, state) {
              return Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    NameWidget(
                      name: state.name,
                      onChanged: (value) {
                        context.read<FormBloc>().add(FormFieldChanged(
                              name: value,
                              email: state.email,
                              phone: state.phone,
                              gender: state.gender,
                              country: state.country,
                              state: state.state,
                              city: state.city,
                            ));
                      },
                    ),
                    EmailWidget(
                      email: state.email,
                      onChanged: (value) {
                        context.read<FormBloc>().add(FormFieldChanged(
                              name: state.name,
                              email: value,
                              phone: state.phone,
                              gender: state.gender,
                              country: state.country,
                              state: state.state,
                              city: state.city,
                            ));
                      },
                    ),
                    PhoneWidget(
                      phone: state.phone,
                      onChanged: (value) {
                        context.read<FormBloc>().add(FormFieldChanged(
                              name: state.name,
                              email: state.email,
                              phone: value,
                              gender: state.gender,
                              country: state.country,
                              state: state.state,
                              city: state.city,
                            ));
                      },
                    ),
                    GenderWidget(
                      gender: state.gender,
                      onChanged: (String? value) {
                        context.read<FormBloc>().add(FormFieldChanged(
                              name: state.name,
                              email: state.email,
                              phone: state.phone,
                              gender: value ?? '',
                              country: state.country,
                              state: state.state,
                              city: state.city,
                            ));
                      },
                    ),
                    LocationWidget(
                      country: state.country,
                      state: state.state,
                      city: state.city,
                      onChanged: (country, updatedState, city) {
                        context.read<FormBloc>().add(FormFieldChanged(
                              name: state.name,
                              email: state.email,
                              phone: state.phone,
                              gender: state.gender,
                              country: country,
                              state: updatedState,
                              city: city,
                            ));
                      },
                      
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<FormBloc>().add(FormSubmitted());

                        if (state.isFormValid) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Form Submitted Successfully')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Please fill out all fields correctly')),
                          );
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
