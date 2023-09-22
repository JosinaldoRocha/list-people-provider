import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/people_model.dart';
import '../../../../data/repositories/people_repository.dart';

class PeopleDetailsPage extends StatelessWidget {
  const PeopleDetailsPage({
    super.key,
    required this.people,
  });
  final PeopleModel people;

  @override
  Widget build(BuildContext context) {
    final peopleRepor = context.watch<PeopleRepository>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome - ${people.title}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sexo - ${people.genre}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Idade - ${people.age}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {
                peopleRepor.deletePeople(people);
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                size: 50,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
