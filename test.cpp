//
// Created by William Leonard Sumendap on 10/27/20.
//

#include "test.h"
#include "main.cpp"
#include <vector>
#include <string>

using namespace std;

void test::runAllTests() {
    test::testOneFound();
    test::testNoneFound();
    test::testMultipleFound();
    test::testOverlaps();
    test::testFallbacks();
    test::testFallbacks2();
    test::stressTest();
}

void test::testOneFound() {
    vector<int> expected;
    string t = "abcdefghijklmnopqrstuvwxyz";
    string q = "ghijklmn";
    expected.push_back(6);
    vector<int> ans = stringSearch(q, t);
    assert(expected == ans);
    cout << "testOneFound passed" << endl;
}

void test::testNoneFound() {
    vector<int> expected;
    string t = "abcdefghijklmnopqrstuvwxyz";
    string q = "abcabc";
    vector<int> ans = stringSearch(q, t);
    assert(expected == ans);
    cout << "testNoneFound passed" << endl;
}

void test::testMultipleFound() {
    vector<int> expected;
    string t = "aabcdefgabcabcdlmnopqrstuabcd";
    string q = "abcd";
    expected.push_back(1);
    expected.push_back(11);
    expected.push_back(25);
    vector<int> ans = stringSearch(q, t);
    assert(expected == ans);
    cout << "testMultipleFound passed" << endl;
}

void test::testOverlaps() {
    vector<int> expected;
    string t = "abcabcabcabc";
    string q = "abcabc";
    expected.push_back(0);
    expected.push_back(3);
    expected.push_back(6);
    vector<int> ans = stringSearch(q, t);
    assert(expected == ans);
    cout << "testOverlaps passed" << endl;
}


void test::testFallbacks() {
    vector<int> expected;
    string t = "ababacabacababacababxabacabab";
    string q = "abacabab";
    expected.push_back(6);
    expected.push_back(12);
    expected.push_back(21);
    vector<int> ans = stringSearch(q, t);
    assert(expected == ans);
    cout << "testFallbacks passed" << endl;
}

void test::testFallbacks2() {
    vector<int> expected;
    string t = "ababababxabababababxababababababx";
    string q = "abababx";
    expected.push_back(2);
    expected.push_back(13);
    expected.push_back(26);
    vector<int> ans = stringSearch(q, t);
    assert(expected == ans);
    cout << "testFallbacks2 passed" << endl;
}

void test::stressTest() {
    vector<int> expected;
    string t ("");
    t.resize(1000000, 'a');
    string q  ("");
    q.resize(1000, 'a');
    for (int i = 0; i < 1000000 - 1000 + 1; i++) {
        expected.push_back(i);
    }
    vector<int> ans = stringSearch(q, t);
    assert(expected == ans);
    cout << "stressTest passed" << endl;
}