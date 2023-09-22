import 'package:flutter/material.dart';
import 'package:list_people_provider/app/data/models/people_model.dart';

class PeopleItemWidget extends StatelessWidget {
  const PeopleItemWidget({
    super.key,
    required this.people,
  });
  final PeopleModel people;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/people-details-page',
            arguments: people,
          );
        },
        child: Text(people.title),
      ),
    );
  }
}
