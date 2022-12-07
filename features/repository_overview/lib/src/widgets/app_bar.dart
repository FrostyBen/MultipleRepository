import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_overview/src/bloc/overview_bloc.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    required this.preferredSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OverviewBloc, OverviewState>(
      builder: (BuildContext context, OverviewState state) {
        return AppBar(
          title: Text('Overview'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                context.read<OverviewBloc>().add(
                      SourceSort(
                        isSortbysource: state.isSortedBySource,
                      ),
                    );
              },
              icon: Icon(Icons.source),
            ),
            IconButton(
              onPressed: () {
                context.read<OverviewBloc>().add(
                      AlphabeticSort(
                        isSortAlphabetic: state.isSortedAlphabetic,
                      ),
                    );
              },
              icon: Icon(Icons.abc),
            ),
            Icon(
              state.isSortedAlphabetic ? Icons.south : Icons.north,
            ),
          ],
        );
      },
    );
  }

  @override
  final Size preferredSize;
}
