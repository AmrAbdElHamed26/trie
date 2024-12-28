## [0.0.1] - 2024-12-28

### Added
- **Trie Data Structure**:
    - Initial implementation of the Trie data structure.
    - Supports insertion of words and associated details.
    - Allows searching by prefix to retrieve all words starting with a given prefix.
    - Includes a `clear` method to reset the Trie by deleting all stored data.

### Tests
- The following test cases have been implemented to ensure the functionality of the Trie class:
    - **Search with Substring**: Verifies that searching with a single character returns the correct user.
    - **Search with Prefix Matching Multiple Users**: Ensures that multiple users with the same prefix are correctly returned.
    - **Search with Non-Matching Prefix**: Ensures that a non-matching prefix returns an empty result.
    - **Search with Invalid Input**: Tests the Trie with invalid input (e.g., "0") to ensure it returns empty.
    - **Multiple Matches**: Verifies that all matching entries are returned when there are multiple matches for a prefix.
    - **Search in Empty Trie**: Verifies that searching in an empty Trie returns an empty result.
    - **Duplicate Data Insertion**: Ensures that adding duplicate data does not create duplicates in the Trie.
    - **Stress Test**: Performs a stress test with 1,000,000 entries to compare the performance and memory usage of the Trie against a list-based search.
    - **Performance Comparison**: Compares the time taken for Trie-based prefix search against a list-based search for large datasets.
