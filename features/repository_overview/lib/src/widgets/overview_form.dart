import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_overview/src/bloc/overview_bloc.dart';
import 'package:repository_overview/src/widgets/app_bar_widget.dart';
import 'package:repository_overview/src/widgets/repositories_list.dart';

class OverviewForm extends StatefulWidget {
  const OverviewForm({super.key});

  @override
  State<OverviewForm> createState() => _OverviewFormState();
}

class _OverviewFormState extends State<OverviewForm> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        preferredSize: Size.fromHeight(56),
      ),
      body: BlocConsumer<OverviewBloc, OverviewState>(
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
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<OverviewBloc>(context).add(GetData());
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: state.usersData.length,
              itemBuilder: (BuildContext context, int index) {
                return RepostoriestList(
                  user: state.usersData[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
