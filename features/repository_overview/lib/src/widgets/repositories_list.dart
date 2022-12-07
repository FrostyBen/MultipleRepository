import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:repository_details/repository_details.dart';

class RepostoriestList extends StatelessWidget {
  const RepostoriestList({
    required this.user,
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => DetailsScreen(
              user: user,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Container(
          height: AppDimension.cardHeight,
          width: MediaQuery.of(context).size.width,
          padding: AppDimension.cardsPading,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: AppDimension.imageSize,
                height: AppDimension.imageSize,
                child: Image.network(user.avatarUrl),
              ),
              SizedBox(
                width: AppDimension.rowPadding,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user.name,
                    ),
                    Text(
                      'source: ${user.source}',
                    ),
                    const SizedBox(height: AppDimension.smallIndent),
                    Text(
                      user.descriptions,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
