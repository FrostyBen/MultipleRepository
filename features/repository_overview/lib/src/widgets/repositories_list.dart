import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RepostoriestList extends StatelessWidget {
  const RepostoriestList({super.key, required this.item});

  final User item;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 160,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text('name: ${item.fullName ?? 'unknown'}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  child: Image.network(item.avatarUrl ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMyp7yl-Sv7BnOFsZYvxE22a6E9fWEFfq891jus41K&s'),
                ),
                Text(
                  'used language ${item.languagesUrl == '' ? 'unknown' : item.languagesUrl}',
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              ' ${item.description == '' || item.description == null ? 'no description has been added yet' : item.description}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
