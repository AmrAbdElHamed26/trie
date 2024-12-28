# Trie Data Structure in Dart

This package provides a basic implementation of a Trie data structure in Dart. It offers functionalities like inserting words, searching by prefix, and clearing the Trie, making it an efficient solution for handling prefix-based search operations.

## Features

- **Efficient word insertion**: Adds words to the Trie with associated details.
- **Prefix-based search**: Retrieve all words starting with a given prefix.
- **Memory efficient**: Significantly more memory-efficient than using a List for large datasets.
- **Clear method**: Easily reset the Trie by deleting all stored data.

## Getting Started

To start using the Trie package, follow these steps:

1. Add the package to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     trie_data_structure: ^0.0.1

2.
  ```dart
   import 'package:trie_data_structure/trie_data_structure.dart';

void main() {
// Initialize a Trie with some initial data
Trie<String> trie = Trie<String>(initialData: [
MapEntry('apple', 'A fruit'),
MapEntry('appetite', 'Desire for food'),
MapEntry('bat', 'A flying mammal'),
MapEntry('ball', 'A spherical object used in sports'),
]);

// Inserting additional words
trie.insert('batman', 'A superhero');
trie.insert('balloon', 'A light inflated object');

// Searching for words with a given prefix
print('Words with prefix "app":');
Set<String> details = trie.getDetailsWithPrefix('app');
details.forEach(print);

// Clearing the trie
trie.clear();
print('Trie cleared.');

// After clearing, trying to search again
Set<String> emptyDetails = trie.getDetailsWithPrefix('app');
print('Details after clearing the trie: $emptyDetails');
}

```