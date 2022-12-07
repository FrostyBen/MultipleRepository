import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_details/repository_details.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});
  String getDescription(User item) {
    if (item.description == null || item.description == '') {
      return 'no description has been added yet';
    } else {
      return item.description!;
    }
  }

  String getFullName(User item) {
    if (item.fullName == null || item.fullName == '') {
      return 'name: unknown';
    } else {
      return 'name: ${item.fullName}';
    }
  }

  Image getImage(User item) {
    if (item.avatarUrl == null || item.avatarUrl == '') {
      return Image.asset('../../assets/question.jpg');
    } else {
      return Image.network(item.avatarUrl!);
    }
  }

  String getlanguage(User item) {
    if (item.languagesUrl == null || item.languagesUrl == '') {
      return 'language: unknown';
    } else {
      return 'used language: ${item.languagesUrl!}';
    }
  }

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
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 5,
              child: Column(
                children: <Widget>[
                  Text(
                    getFullName(state.user),
                  ),
                  const SizedBox(
                    height: AppDimension.smallIndent,
                  ),
                  Container(
                    height: 150,
                    child: getImage(state.user),
                  ),
                  const SizedBox(height: AppDimension.smallIndent),
                  Text(
                    getDescription(state.user),
                  ),
                  const SizedBox(height: AppDimension.midIndent),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        getlanguage(state.user),
                      ),
                      Text('source: ${state.user.source!}')
                    ],
                  ),
                  SizedBox(height: AppDimension.smallIndent),
                  Text(
                    state.user.url ?? 'no link',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
