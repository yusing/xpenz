class Regex {
  static bool isMatch(String pattern, String input) {
    return RegExp(pattern).stringMatch(input) == input;
  }
}