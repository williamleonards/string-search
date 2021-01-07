#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

#include "test.h"

using namespace std;

/*
 * Preprocess the query string and return a 2D vector 'v' such that
 * v[i][j] is whether we can fallback from index i to index j.
 * This means if we are trying to match S[i] and we fail, we can start by trying to match S[j] instead of starting
 * from the beginning.
 */
vector<vector<bool>> preprocess(string S) {

    int M = S.size();
    vector<vector<bool>> ans(M, vector<bool>(M, false));

    /*
     * Index i may fallback to j when S[0..j-2] is a suffix of S[0..i-1].
     * We can fill vector v in a certain manner so that O(M) entries get filled in O(M) time.
     */
    for (int i = 0; i < M; i++) {
        // Starting from the beginning is always possible.
        ans[i][0] = true;
    }

    // k = i - j
    for (int k = 0; k < M - 1; k++) {

        ans[1+k][1] = true; // when j == 1, S[0..j-2] is am empty string, so it is a suffix of any string

        /*
         * To check S[0..j-2] is a suffix of S[0..i-1], we need to check whether S[0..j-2] == S[k+1..j+k-1],
         * where k = i - j.
         * Here, we can handle v[k+1][1], v[k+2][2], ..., v[M-1][M-k-1] simultaneously.
         * In this traversal, both the LHS and RHS of the above extend to the right,
         * we can handle each query in O(1) time.
         */
        bool status = true;
        for (int j = 2; j < M - k; j++) {
            if (!status) {
                ans[j+k][j] = false;
                continue;
            }
            if (S[j-2] == S[j+k-1]) {
                ans[j+k][j] = true;
            } else {
                status = false;
                ans[j+k][j] = false;
            }
        }
    }
    return ans;
}

/*
 * Construct a lookup table to tell which index to fallback given the index of the mismatch and the mismatching character.
 */
vector<vector<int>> lookup(vector<vector<bool>> table, string S) { // index, char --> fallback index

    int M = S.size();
    vector<vector<int>> ans(M, vector<int>(26, 0));

    for (int i = 1; i < M; i++) {
        for (int j = 1; j <= i; j++) {
            if (table[i][j]) {
                //Index i can fall back to j when the mismatching character equals S[j-1].
                int mismatchChar = (int) (S[j-1] - 'a');

                // For any mismatching character and an index, save the best (i.e., largest) fallback index.
                ans[i][mismatchChar] = max(j, ans[i][mismatchChar]);
            }
        }
    }
    return ans;
}

vector<int> stringSearch(string S, string T) {

    vector<int> ans;

    vector<vector<bool>> result = preprocess(S);
    vector<vector<int>> lookupTable = lookup(result, S);

    int M = S.size();
    int N = T.size();
    int j = 0;

    for (int i = 0; i < N; i++) {
        char now = T[i]; // current char in text
        if (now == S[j]) {
            // an occurence is found
            j++;
            if (j == M) {
                j = lookupTable[M-1][(int) (now - 'a')]; // start again at the appropriate fallback index
                ans.push_back(i - M + 1);
            }
        } else {
            // a mismatch occurs
            j = lookupTable[j][(int) (now - 'a')];
        }
    }
    return ans;
}

int main() {
    test::runAllTests();
    return 0;
}