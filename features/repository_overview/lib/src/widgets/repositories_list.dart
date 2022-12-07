import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:repository_details/repository_details.dart';

class RepostoriestList extends StatelessWidget {
  const RepostoriestList({
    required this.item,
    Key? key,
  }) : super(key: key);

  final User item;

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
    if (item.avatarUrl == null) {
      return Image.asset('../../assets/question.jpg');
    } else {
      return Image.network(item.avatarUrl!);
    }
  }

  String getName(User item) {
    if (item.fullName == null || item.fullName == '') {
      return 'name: unknown';
    } else {
      return item.fullName!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DetailsScreen(
              user: item,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Container(
          height: AppDimension.cardHeight,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: AppDimension.cardsPading,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  child: getImage(item),
                ),
                SizedBox(
                  width: AppDimension.rowPadding,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        getFullName(item),
                      ),
                      Text(
                        'source: ${item.source}',
                      ),
                      const SizedBox(height: AppDimension.smallIndent),
                      Text(
                        getDescription(item),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
