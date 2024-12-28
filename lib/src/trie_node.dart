
class TrieNode<T> {
  late Map<String, TrieNode<T>> children;

  late bool isEndOfWord;

  late Set<T> detailsSet;

  TrieNode() {
    children = {};
    isEndOfWord = false;
    detailsSet = {};
  }

  void deleteAll() {
    for (var child in children.values) {
      child.deleteAll();
    }
    children.clear();
    detailsSet.clear();
    isEndOfWord = false;
  }
}
