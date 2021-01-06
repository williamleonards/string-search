# CUSTOM STRING SEARCHING ALGORITHM

A custom string search algorithm similar to Knuth-Morris-Pratt (KMP) that runs in linear time of the text size and quadratic time of the query string length.

Denote the length of input text (T) as N and that of the query string (S) be M.

1) The goal is to have linear runtime in terms of N. Having noted this goal and that the problem is finding a bunch of consecutive objects (characters in this case) in an array, a sliding window approach naturally springs to mind.

2) That being said, the main challenge is to come up with a procedure to advance the start pointer, whenever a mismatch occurs. 

3) An alternate way of viewing this issue is to keep a copy of the query string and an index of the character currently being looked up. When a mismatch occurs at index i, we need a procedure to fall back to a previous index j (which is not necessarily zero* and depends on the character encountered in T during the mismatch**).

I began experimenting with the query strings:
The most basic query is that of all distinct characters (e.g., “abcdef”). Whenever a mismatch occurs, we need to start over (fall back to index 0 of our query).
On the other extreme is a query with all the same character (e.g., “aaaaa”). This serves as evidence that the fallback is not necessarily 0, which is idea (*).
The most tricky query is where fallbacks from the same index i may occur to different indices j, depending on the mismatching character in T. One example is “abacabax”, when a mismatch occurs at the last index (‘x’), then the fallback depends on the mismatching character. If it is ‘c’, then we fall back to index 4 (right after ‘c’). If it is ‘b’, we fall back to index 2 (right after the first ‘b’). If it is ‘a’, we fall back to index 1, and finally, if it is anything else, we start over at index 0, looking for ‘a’. This is evidence of idea (**).

4) Having formulated the idea (**), it seemed natural to come up with a N-by-N lookup table specifying whether or not it is possible to fall back from index i to index j (< i). If it is, then the mismatching character from T (at index i of S) is uniquely determined, because it has to be S[j - 1] (j > 0).

5) I formalised the notion of what it means to be able to “fall back from index i to index j”. It is precisely (if and only if) when S[0..j-2] is a suffix of S[0..i-1] AND S[j-1] == c, where c is the mismatching character found on T***.

6) That being said, a trivial way to come up with the lookup table is an O(M^3) runtime solution using a double for loop for each (i, j), and taking linear time to check the criterion (***).

7) I was not satisfied and sensed that I can somehow handle O(M) pairs (i, j) in O(M) time, giving an average O(1) time for each query. 

8) Handling (i, 0), (i, 1), …, (i, i-1) together would not help. While S[i..i], S[i-1..i], S[i-2..i], …, S[1..i] (the RHS of the criterion) are substrings of each other and that the same is true for S[0..0], S[0..1], …, S[0..i-1] (the LHS of the criterion), the first group extends backwards, while the other extends forward.

9) I need to traverse the lookup table in such a way that both LHS and RHS of the criterion (***) extends in the same direction (e.g., forward). That way, each query only takes O(1) time depending on the previous result. If the previous is true, then we check if the characters that are added to LHS and RHS are the same. Otherwise, it must be false, since A ≠ B → A + x ≠ B + x for any strings A, B and any character x. 

10) This idea leads to the traversal of the lookup table as follows (k from 0 to M - 2):  (k+1, 1), …, (M - 1, M - k - 1). 

11) Having filled the M-by-M lookup table, we need to transform the lookup table. Upon encountering a mismatch at index i of S, we don’t want to check for all j in [0, i) whether we can fall back to that index. Instead, we need the table to tell us where to fall back if we encounter a mismatch at i with the mismatching character x. 

At this point, we noted that there may be multiple indices to fall back from i with character x. This is illustrated in the query “abababx”, with mismatch occurring at the last index and character ‘a’. Here, we can fall back to index 1, 3, or 5 (or 0). However, if we choose any fall back that is not the largest (5 in this case), we risk not detecting some occurrences of S in T. For instance, if T = “ababababx” and we fell back to index 3, then we would think that ‘x’ is a mismatch, where in fact it constitutes an occurrence of S. 

The converse does not apply; if we fall back to the largest index possible, we do not run the risk of missing an occurrence of S. For instance, if T = “abababababx”, and a mismatch occurs at index 6 of S (character ‘x’), it may be tempting to say that 3 is the correct fallback. But falling back to 5 does not pose such a risk. The largest (i.e., best) fallback to index 5 (thereby delaying the progress by 2 characters) shows that we can't find a match in the next character; the earliest match we can possibly get is within 2 characters.

Indeed, upon reaching the last ‘a’ of T, we would encounter another mismatch at index 6 of S, falling back to index 5 of S, and finally getting an occurrence of S upon encountering the last character of T. This is due to the transitive property of fallbacks, proven below.

12) Having transformed our lookup table to tell us the highest-indexed fallback given an index and character, we can proceed with our sliding window, recording the start indices whenever we encounter S. We need to take caution on how we proceed to fall back after encountering an occurrence of S.
