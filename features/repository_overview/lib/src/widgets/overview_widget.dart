import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_overview/src/bloc/overview_bloc.dart';
import 'package:repository_overview/src/widgets/repositories_list.dart';

class OverviewWidget extends StatefulWidget {
  const OverviewWidget({super.key});

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OverviewBloc, OverviewState>(
      listener: (BuildContext context, OverviewState state) {
        if (state is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
              ),
            ),
          );
        }
      },
      builder: (BuildContext context, OverviewState state) {
        if (state is OverviewLoaded) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async {
                final Future<OverviewState> bloc =
                    context.read<OverviewBloc>().stream.first;
                BlocProvider.of<OverviewBloc>(context).add(GetData());
                await bloc;
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.usersData.length,
                itemBuilder: (BuildContext context, int index) {
                  return RepostoriestList(
                    item: state.usersData[index],
                  );
                },
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
