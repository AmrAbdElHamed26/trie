import 'package:trie_search/src/trie_node.dart';

class Trie<T> {
  final TrieNode<T> root;

  /// Constructor to initialize the Trie. Optionally, you can provide initial data.
  Trie({List<MapEntry<String, T>>? initialData}) : root = TrieNode<T>() {
    if (initialData != null) {
      insertAll(initialData);
    }
  }

  /// Clears the trie by deleting all entries.
  void clear() {
    root.deleteAll();
  }

  /// Inserts a word into the trie with associated details.
  /// The details are stored at the end of the word.
  void insert(String word, T details) {
    TrieNode<T> node = root;

    for (int i = 0; i < word.length; i++) {
      String char = word[i];

      if (!node.children.containsKey(char)) {
        node.children[char] = TrieNode<T>();
      }

      node = node.children[char]!;
    }

    node.isEndOfWord = true;

    node.detailsSet.add(details);
  }

  /// Inserts multiple words with their associated details.
  /// This is done by calling `insert` on each key-value pair.
  void insertAll(List<MapEntry<String, T>> data) {
    for (var entry in data) {
      insert(entry.key, entry.value);
    }
  }

  /// Retrieves all details for words that start with the given prefix.
  /// Returns a Set of details associated with matching words.
  Set<T> getDetailsWithPrefix(String prefix) {
    TrieNode<T> node = root;

    for (int i = 0; i < prefix.length; i++) {
      String char = prefix[i];

      if (!node.children.containsKey(char)) {
        return {};
      }
      node = node.children[char]!;
    }

    return _getDetailsWithPrefix(node);
  }


  Set<T> _getDetailsWithPrefix(TrieNode<T> node) {
    Set<T> detailsSet = Set<T>(); // A set to accumulate results

    // Add all the details from the current node's detailsSet
    detailsSet.addAll(node.detailsSet);

    // Recursively add details from all child nodes
    node.children.forEach((char, childNode) {
      detailsSet.addAll(_getDetailsWithPrefix(childNode));
    });

    return detailsSet;
  }
}
