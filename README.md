# Trie Data Structure in Dart

This package provides a basic implementation of a Trie data structure in Dart. It offers functionalities like inserting words, searching by prefix, and clearing the Trie, making it an efficient solution for handling prefix-based search operations.

## Features

- **Efficient word insertion**: Adds words to the Trie with associated details.
- **Prefix-based search**: Retrieve all words starting with a given prefix.
- **Memory efficient**: Significantly more memory-efficient than using a List for large datasets with common prefixes.
- **Clear method**: Easily reset the Trie by deleting all stored data.


## Memory and Time Efficiency

### Memory Efficiency:
- The Trie stores common prefixes once, which reduces memory usage compared to a List, where each word (even with common prefixes) is stored separately.
- The visual below demonstrates how a Trie uses less memory by sharing nodes for common prefixes, compared to a List storing each word in full.

### Time Efficiency:
- Tries provide faster search and insert operations compared to Lists. Inserting or searching for a word in a Trie takes O(L) time, where L is the length of the word. In contrast, searching or inserting in a List takes O(N) time, where N is the number of words.
- As the dataset 

![Trie Data Structure Efficiency](https://github.com/user-attachments/assets/b576e392-9f1a-48e7-8a38-4e0f7d3f879e)


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
