#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

#include "test.h"

using namespace std;

vector<vector<bool>> preprocess(string S) {
    int M = S.size();
    vector<vector<bool>> ans(M, vector<bool>(M, false));
    for (int i = 0; i < M; i++) { // i --> j
        ans[i][0] = true;
    }
    for (int k = 0; k < M - 1; k++) { // i = j + k
        ans[1+k][1] = true;
        bool status = true;
        for (int j = 2; j < M - k; j++) {
            if (!status) {
                ans[j+k][j] = false;
                continue;
            }
            if (S[j-2] == S[k+j-1]) {
                ans[j+k][j] = true;
            } else {
                status = false;
                ans[j+k][j] = false;
            }
        }
    }
    return ans;
}
vector<vector<int>> lookup(vector<vector<bool>> table, string S) { // index, char --> fallback index
    int M = S.size();
    vector<vector<int>> ans(M, vector<int>(26, 0));
    for (int i = 1; i < M; i++) {
        for (int j = 1; j <= i; j++) {
            if (table[i][j]) {
                ans[i][(int) (S[j-1] - 'a')] = max(j, ans[i][(int) (S[j-1] - 'a')]);
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
        char now = T[i];
        if (now == S[j]) {
            j++;
            if (j == M) {
                j = lookupTable[M-1][(int) (now - 'a')];
                ans.push_back(i - M + 1);
            }
        } else {
            j = lookupTable[j][(int) (now - 'a')];
        }
    }
    return ans;
}
int main() {
    test::runAllTests();
    return 0;
}