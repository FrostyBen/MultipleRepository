import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_details/repository_details.dart';

class DetailsForm extends StatelessWidget {
  const DetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBloc, DetailsState>(
      listener: (BuildContext context, DetailsState state) {
        if (state is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errormessage,
              ),
            ),
          );
        }
      },
      builder: (BuildContext context, DetailsState state) {
        if (state is DetailsLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: Text('details'),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    Text(
                      state.user.name,
                    ),
                    const SizedBox(
                      height: AppDimension.smallIndent,
                    ),
                    Container(
                      height: 150,
                      child: Image.network(state.user.avatarUrl),
                    ),
                    const SizedBox(height: AppDimension.smallIndent),
                    Text(
                      state.user.descriptions,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppDimension.midIndent),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          state.user.language,
                        ),
                        Text('source: ${state.user.source}')
                      ],
                    ),
                    SizedBox(height: AppDimension.smallIndent),
                    Text(
                      state.user.selfUrl,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
