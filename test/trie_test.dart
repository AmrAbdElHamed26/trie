import 'package:flutter_test/flutter_test.dart';
import 'package:trie_search/trie.dart';

class Employee {
  final int id;
  final String name;
  final String jobTitle;
  final String workEmail;

  Employee({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.workEmail,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Employee &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

void main() {
  late Trie<Employee> trie;

  final List<Employee> employeesList = [
    Employee(id: 1, name: 'john Doe', jobTitle: 'Developer', workEmail: 'john@example.com'),
    Employee(id: 2, name: 'ali', jobTitle: 'Manager', workEmail: 'ali@example.com'),
    Employee(id: 3, name: 'amr', jobTitle: 'Analyst', workEmail: 'amr@example.com'),
    Employee(id: 4, name: 'ali Amr', jobTitle: 'Consultant', workEmail: 'aliamr@example.com'),
    Employee(id: 5, name: 'ahmed', jobTitle: 'Designer', workEmail: 'ahmed@example.com'),
  ];

  setUp(() {
    trie = Trie();

    for (Employee employee in employeesList) {
      trie.insert(employee.name, employee);
    }
  });

  group("Trie Data Structure Tests", () {
    test('Search with substring should return a single user', () {
      var result = trie.getDetailsWithPrefix("j");
      expect(result, equals([employeesList[0]]));
    });

    test('Search with prefix matching multiple users', () {
      var result = trie.getDetailsWithPrefix("ali");
      expect(result, equals([employeesList[1], employeesList[3]]));
    });

    test('Search with non-matching prefix should return empty list', () {
      var result = trie.getDetailsWithPrefix("mohamed ahmed");
      expect(result, isEmpty);
    });

    test('Search with invalid input should return empty list', () {
      var result = trie.getDetailsWithPrefix("0");
      expect(result, isEmpty);
    });

    test('Search with multiple matches', () {
      var result = trie.getDetailsWithPrefix("a");
      expect(result, equals([employeesList[1], employeesList[3], employeesList[2], employeesList[4]]));
    });

    test('Search in empty trie', () {
      Trie<Employee> emptyTrie = Trie();
      var result = emptyTrie.getDetailsWithPrefix("amr");
      expect(result, isEmpty);
    });

    test('Adding duplicate data should not create duplicates', () {
      for (Employee employee in employeesList) {
        trie.insert(employee.name, employee);
      }
      var result = trie.getDetailsWithPrefix("a");
      expect(result, equals([employeesList[1], employeesList[3], employeesList[2], employeesList[4]]));
    });




    int numberOfEmployees = 1000000;
    test('Stress test with $numberOfEmployees users', () {
      final List<Employee> largeEmployeeList = List.generate(
        numberOfEmployees,
            (index) => Employee(
          id: index + 1,
          name: 'employee $index',
          jobTitle: 'Job $index',
          workEmail: 'employee$index@example.com',
        ),
      );

      for (Employee employee in largeEmployeeList) {
        trie.insert(employee.name, employee);
      }


      final trieResult = trie.getDetailsWithPrefix("emplo");
      final listResult = largeEmployeeList.where((e) => e.name.startsWith("emplo")).toList();

      int estimateSizeOfObject(dynamic object) {
        return object.toString().length;
      }

      final trieMemoryEstimate = estimateSizeOfObject(trie);
      final listMemoryEstimate = estimateSizeOfObject(largeEmployeeList);

      print('Estimated memory usage for Trie With $numberOfEmployees Length: $trieMemoryEstimate bytes');
      print('Estimated memory usage for List With $numberOfEmployees Length: $listMemoryEstimate bytes');
      print("-------------------------------------------------");

      expect(trieResult.length, equals(listResult.length));
    });



    test('Compare time taken for Trie vs List search', () {
      final List<Employee> employeesList2 = [
        Employee(id: 1, name: 'John Doe', jobTitle: 'Developer', workEmail: 'john@example.com'),
        Employee(id: 2, name: 'Ali', jobTitle: 'Manager', workEmail: 'ali@example.com'),
        Employee(id: 3, name: 'Amr', jobTitle: 'Analyst', workEmail: 'amr@example.com'),
        Employee(id: 4, name: 'Ali Amr', jobTitle: 'Consultant', workEmail: 'aliamr@example.com'),
        Employee(id: 5, name: 'Ahmed', jobTitle: 'Designer', workEmail: 'ahmed@example.com'),
        Employee(id: 6, name: 'Alaa', jobTitle: 'Engineer', workEmail: 'alaa@example.com'),
        Employee(id: 7, name: 'Salma', jobTitle: 'HR', workEmail: 'salma@example.com'),
        Employee(id: 8, name: 'Sara', jobTitle: 'Support', workEmail: 'sara@example.com'),
        Employee(id: 9, name: 'Mohamed', jobTitle: 'Marketing', workEmail: 'mohamed@example.com'),
        Employee(id: 10, name: 'Mostafa', jobTitle: 'Tester', workEmail: 'mostafa@example.com'),
        Employee(id: 11, name: 'Marwan', jobTitle: 'Consultant', workEmail: 'marwan@example.com'),
        Employee(id: 12, name: 'Mina', jobTitle: 'Analyst', workEmail: 'mina@example.com'),
        Employee(id: 13, name: 'Reem', jobTitle: 'Designer', workEmail: 'reem@example.com'),
        Employee(id: 14, name: 'Rania', jobTitle: 'Developer', workEmail: 'rania@example.com'),
        Employee(id: 15, name: 'Tamer', jobTitle: 'Manager', workEmail: 'tamer@example.com'),
        Employee(id: 16, name: 'Hassan', jobTitle: 'Consultant', workEmail: 'hassan@example.com'),
        Employee(id: 17, name: 'Omar', jobTitle: 'Analyst', workEmail: 'omar@example.com'),
        Employee(id: 18, name: 'Nour', jobTitle: 'Developer', workEmail: 'nour@example.com'),
        Employee(id: 19, name: 'Lina', jobTitle: 'Support', workEmail: 'lina@example.com'),
        Employee(id: 20, name: 'Youssef', jobTitle: 'Engineer', workEmail: 'youssef@example.com'),
        Employee(id: 21, name: 'Youssef', jobTitle: 'Engineer', workEmail: 'youssef@example.com'),
      ];

      Trie<Employee> trie = Trie();

       for (var employee in employeesList2) {
        trie.insert(employee.name.toLowerCase(), employee);
      }

      const String prefix = 'Y';

      final trieStopwatch = Stopwatch()..start();
      final trieResult = trie.getDetailsWithPrefix(prefix.toLowerCase());
      trieStopwatch.stop();
      print('Time taken to search in Trie: ${trieStopwatch.elapsedMicroseconds} µs');
      print('Trie search results: ${trieResult.map((e) => e.name).toList()}');

      final listStopwatch = Stopwatch()..start();
      final listResult = employeesList2
          .where((employee) => employee.name.toLowerCase().startsWith(prefix.toLowerCase()))
          .toList();
      listStopwatch.stop();
      print('Time taken to search in List: ${listStopwatch.elapsedMicroseconds} µs');
      print('List search results: ${listResult.map((e) => e.name).toList()}');

      final sortedTrieResult = List.from(trieResult)
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      final sortedListResult = List.from(listResult)
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      expect(sortedTrieResult.length, equals(sortedListResult.length));
      expect(
        sortedTrieResult.map((e) => e.name.toLowerCase()),
        equals(sortedListResult.map((e) => e.name.toLowerCase())),
      );
    });


  });
}
