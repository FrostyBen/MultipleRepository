import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_overview/src/widgets/overview_widget.dart';

import '../bloc/overview_bloc.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OverviewBloc(
              getDataUsecase: appLocator.get<GetGitHubDataUsecase>(),
              getBitbucketDataUseCase:
                  appLocator.get<GetBitbucketDataUseCase>(),
            )..add(GetData()),
        child: OverviewWidget());
  }
}
