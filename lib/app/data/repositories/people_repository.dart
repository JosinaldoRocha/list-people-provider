import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:list_people_provider/app/data/models/people_model.dart';

class PeopleRepository extends ChangeNotifier {
  final List<PeopleModel> _peoples = [
    PeopleModel(
      id: '01',
      title: 'Josinaldo',
      age: '32',
      genre: 'Masculino',
    ),
    PeopleModel(
      id: '02',
      title: 'Ana Maria',
      age: '25',
      genre: 'Feminino',
    ),
    PeopleModel(
      id: '03',
      title: 'Elaine',
      age: '34',
      genre: 'Feminino',
    ),
  ];

  UnmodifiableListView<PeopleModel> get lista => UnmodifiableListView(_peoples);

  List<PeopleModel> get people => _peoples;

  Future<List<PeopleModel>> getAll() async {
    await Future.delayed(const Duration(seconds: 2));

    return _peoples;
  }

  void addPeople(PeopleModel people) {
    _peoples.add(people);
    notifyListeners();
  }

  void deletePeople(PeopleModel people) {
    _peoples.remove(people);
    notifyListeners();
  }
}
