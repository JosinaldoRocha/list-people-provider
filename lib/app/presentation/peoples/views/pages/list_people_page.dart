import 'package:flutter/material.dart';
import 'package:list_people_provider/app/data/repositories/people_repository.dart';
import 'package:list_people_provider/app/presentation/peoples/views/widgets/people_item_widget.dart';
import 'package:provider/provider.dart';
import '../widgets/add_people_widget.dart';

class ListPeoplePage extends StatelessWidget {
  const ListPeoplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 50,
        ),
        child: Column(
          children: [
            Consumer<PeopleRepository>(
              builder: (context, peopleRepor, child) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => PeopleItemWidget(
                    people: peopleRepor.lista[index],
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: peopleRepor.lista.length,
                );
              },
            ),
            const Expanded(child: SizedBox()),
            const AddPeopleWidget(),
          ],
        ),
      ),
    );
  }
}
