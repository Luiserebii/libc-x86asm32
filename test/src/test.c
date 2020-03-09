#include "../lib/unity.h"

void test_string_strlen();

void setUp() {}
void tearDown() {}

int main() {
    UNITY_BEGIN();
    RUN_TEST(test_string_strlen);
    return UNITY_END();
}

void test_string_strlen() {
    TEST_ASSERT(1);
}
