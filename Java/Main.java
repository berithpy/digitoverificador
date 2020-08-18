class Main {
  public static void main(String[] args) {
    // Exemples
    System.out.println("80046961-" + verifyingDigit("80046961")); // 80046961-5
    System.out.println("80078501-" + verifyingDigit("80078501")); // 80078501-0
    System.out.println("80007692-" + verifyingDigit("80007692")); // 80007692-3
  }

  public static String verifyingDigit(String ruc) {
    char[] rucArray = ruc.toCharArray();

    Integer verifyingDigit = 0;
    for (int i = rucArray.length - 1, weight = 2; i >= 0; i--, weight++) {
      verifyingDigit += Character.getNumericValue(rucArray[i]) * weight;
    }

    verifyingDigit %= 11;
    verifyingDigit = (verifyingDigit > 1) ? 11 - verifyingDigit : 0;

    return String.valueOf(verifyingDigit);
  }
}
