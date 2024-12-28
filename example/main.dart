
import 'package:trie_search/trie.dart';

import 'employee_entity.dart';

void main() {
  List<Employee> employeeList = [
    Employee(
        id: 1,
        name: 'Apple Inc.',
        jobTitle: 'Tech',
        workEmail: 'apple@company.com'),
    Employee(
        id: 2,
        name: 'Batman',
        jobTitle: 'Superhero',
        workEmail: 'batman@hero.com'),
    Employee(
        id: 3,
        name: 'Ball Corp.',
        jobTitle: 'Sports',
        workEmail: 'ball@company.com'),
  ];

  Trie<Employee> trie = Trie<Employee>(
      initialData: [
    MapEntry('apple', employeeList[0]),
    MapEntry('bat', employeeList[1]),
    MapEntry('ball', employeeList[2]),
  ]);

  trie.insert(
      'batman',
      Employee(
          id: 4,
          name: 'Bruce Wayne',
          jobTitle: 'CEO',
          workEmail: 'wayne@corp.com'));
  trie.insert(
      'balloon',
      Employee(
          id: 5,
          name: 'John Balloon',
          jobTitle: 'Artist',
          workEmail: 'john@balloon.com'));

  print('Employees with prefix "ball" in Trie:');
  Set<Employee> trieResult = trie.getDetailsWithPrefix('ball');
  trieResult.forEach((employee) {
    print('Name: ${employee.name}, Job: ${employee.jobTitle}, Email: ${employee.workEmail}');
  });

  print('Employees with prefix "ball" in List:');
  List<Employee> listResult = employeeList
      .where((employee) => employee.name.startsWith('ball'))
      .toList();
  listResult.forEach((employee) {
    print('Name: ${employee.name}, Job: ${employee.jobTitle}, Email: ${employee.workEmail}');
  });

  trie.clear();
  print('Trie cleared.');

  Set<Employee> emptyDetails = trie.getDetailsWithPrefix('ball');
  print('Details after clearing the Trie: $emptyDetails');
}
