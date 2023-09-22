import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/people_model.dart';
import '../../../../data/repositories/people_repository.dart';

class AddPeopleWidget extends StatelessWidget {
  const AddPeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //final repository = Provider.of<PeopleRepository>(context);
    final peopleRepor = context.watch<PeopleRepository>();
    final nameController = TextEditingController();
    final genreController = TextEditingController();
    final ageController = TextEditingController();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: SizedBox(
              height: 300,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                  ),
                  const Text('Nome'),
                  TextFormField(
                    controller: genreController,
                  ),
                  const Text('Sexo'),
                  TextFormField(
                    controller: ageController,
                  ),
                  const Text('Idade'),
                  const Expanded(child: SizedBox()),
                  ElevatedButton(
                    onPressed: () {
                      final item = PeopleModel(
                        id: Random().nextInt(100).toString(),
                        title: nameController.text,
                        age: ageController.text,
                        genre: genreController.text,
                      );
                      peopleRepor.addPeople(item);
                      Navigator.pop(context);
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: const Icon(
        Icons.add,
        size: 50,
      ),
    );
  }
}
