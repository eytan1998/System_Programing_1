
int power(int a, int b) {
    int sum = 1;
    for (int i = 0; i < b; i++) {
        sum *= a;
    }
    return sum;
}

int getLength(int n) {
    int length = 0;
    for (; n > 0; n /= 10) {
        length++;
    }
    return length;
}

int isPalindromeReq(int n, int length) {
    if (length == 1) return n;
    int lastToFirst = (n % 10 * power(10, length - 1));
    return (lastToFirst + isPalindromeReq(n / 10, length - 1));
}

int isPalindrome(int n) {
    int length = getLength(n);
    return (isPalindromeReq(n, length) == n);
}

int isArmstrongReq(int n, int length) {
    if (n == 0) return 0;
    return (isArmstrongReq(n / 10, length) + power(n % 10, length));
}

int isArmstrong(int n) {
    int length = getLength(n);
    return (isArmstrongReq(n, length) == n);
}

