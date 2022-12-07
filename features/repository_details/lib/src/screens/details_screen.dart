import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_details/repository_details.dart';

import '../widgets/details_form.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({this.user, super.key});
  final User? user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (BuildContext context) => DetailsBloc()
        ..add(
          GetDetails(user: user!),
        ),
      child: DetailsForm(),
    );
  }
}
