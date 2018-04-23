import java.io.PrintWriter;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

class Playfair {

    private static char[] alphabet = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
    private static ArrayList<String> frequentWords = new ArrayList<>();
    private static ArrayList<String> frequentDigraphs = new ArrayList<>();

    static String DEFAULT_ENCRYPTED_TEXT = "BMODZBXDNABEKUDMUIXMMOUVIF";
    static char[][] DEFAULT_KEY = { {'P', 'L', 'A', 'Y', 'F'}, {'I', 'R', 'E', 'X', 'M'}, {'B', 'C', 'D', 'G', 'H'}, {'K', 'N', 'O', 'Q', 'S'}, {'T', 'U', 'V', 'W', 'Z'} };

    private static int numberOfAttempts = 1000;

    static {
        frequentWords.add("IS");
        frequentWords.add("THE");
        frequentWords.add("BE");
        frequentWords.add("TO");
        frequentWords.add("AND");
        frequentWords.add("OF");

        frequentDigraphs.add("TH");
        frequentDigraphs.add("ER");
        frequentDigraphs.add("ON");
        frequentDigraphs.add("AN");
        frequentDigraphs.add("RE");
        frequentDigraphs.add("HE");
        frequentDigraphs.add("IN");
        frequentDigraphs.add("ED");
    }

    static String decrypt(String encryptedText, char[][] key) {
        int r1=0, c1=0, r2=0, c2=0;
        StringBuilder decryptedText = new StringBuilder();

        for (int i = 0; i < encryptedText.length(); i+=2) {

            char letter1 = encryptedText.charAt(i);
            char letter2 = encryptedText.charAt(i+1);
            for (int r = 0; r < 5; r++) {
                for (int c = 0; c < 5; c++) {
                    if (letter1 == key[r][c]) {
                        r1 = r;
                        c1 = c;
                    }
                    if (letter2 == key[r][c]) {
                        r2 = r;
                        c2 = c;
                    }
                }
            }

            if (r1 == r2) {
                c1 = (c1 + 4) % 5;
                c2 = (c2 + 4) % 5;
            } else if (c1 == c2) {
                r1 = (r1 + 4) % 5;
                r2 = (r2 + 4) % 5;
            } else {
                int temp = c1;
                c1 = c2;
                c2 = temp;
            }

            decryptedText.append(String.valueOf(key[r1][c1])).append(String.valueOf(key[r2][c2]));
        }

        return decryptedText.toString();

    }

    static void bruteForceDecrypt(String encryptedText, int keywordLength) {
        System.out.println("\nStarted brute force decrypting...\n");

        int count = 0;
        float maxScore = 0;
        int maxScoreAttempt = 0;
        char[][] key = getRandomKey(keywordLength);
        char[][] changedKey;

        PrintWriter printWriter = null;
        String decryptedText;
        try {
            printWriter = new PrintWriter("attempts.txt", "UTF-8");
        } catch (Exception exception) {
            exception.printStackTrace();
        }

        // Main loop
        while (count <= numberOfAttempts) {
            changedKey = changeKey(key, keywordLength);
            decryptedText = decrypt(encryptedText, changedKey);
            float score = getKeyScore(decryptedText);
            if (maxScore <= score) {
                maxScore = score;
                maxScoreAttempt = count;
                for (int i = 0; i < 5; i++) {
                    for (int j = 0; j < 5; j++) {
                        key[i][j] = changedKey[i][j];
                    }
                }
            }
            if (score > 4)
                display(count, decryptedText, changedKey, score, printWriter);
            count++;
            if (Objects.equals(decryptedText, "HIDETHEGOLDINTHETREXESTUMP")) {
                display(count, decryptedText, changedKey, score, printWriter);
                break;
            }
        }

        System.out.println("##########################################################################################################\nMax score = " + maxScore + "\nMax score attempt = " + maxScoreAttempt);
        printWriter.println("##########################################################################################################\nMax score = " + maxScore + "\nMax score attempt = " + maxScoreAttempt);

        printWriter.close();

        System.out.println("\n...ended brute force decrypting");
    }

    static boolean isValidSymbol(char symbol) {
        for (char letter : alphabet) {
            if (symbol == letter)
                return true;
        }
        return false;
    }

    private static char[][] getRandomKey(int keywordLength) {
        List<Character> chars = new ArrayList<>();
        for (char c : alphabet) {
            chars.add(c);
        }
        Collections.shuffle(chars);
        Collections.sort(chars.subList(keywordLength, 25));

        int index = 0;
        char [][] randomKey = new char[5][5];
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                randomKey[i][j] = chars.get(index++);
            }
        }
        return randomKey;
    }

    private static char[][] changeKey(char[][] key, int keywordLength) {
        List<Character> chars = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                chars.add(key[i][j]);
            }
        }

        System.out.println(chars);

        int index1 = ThreadLocalRandom.current().nextInt(0, keywordLength);
        int index2 = index1;
        while (index1 == index2) {
            index2 = ThreadLocalRandom.current().nextInt(0, 25);
        }

        Collections.swap(chars, index1, index2);
        Collections.sort(chars.subList(keywordLength, 25));

        Iterator<Character> iterator = chars.iterator();

        int index = 0;
        char [][] changedKey = new char[5][5];
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if (iterator.hasNext())
                    changedKey[i][j] = iterator.next();
                else
                    System.out.println("Error - This should not happen");
            }
        }
        return changedKey;
    }

    private static float getKeyScore(String decryptedText) {
        float score = 0;
        for (String frequentWord : frequentWords) {
            if (decryptedText.contains(frequentWord)) {
                score++;
            }
        }

        for (String frequentDigraph : frequentDigraphs) {
            if (decryptedText.contains(frequentDigraph)) {
                score += 0.8;
            }
        }

        for (char c : getMostFrequentLetters(decryptedText)) {
            if (c == 'E')
                score += 0.48;
            if (c == 'T')
                score += 0.36;
            if (c == 'A')
                score += 0.32;
            if (c == 'O')
                score += 0.28;
            if (c == 'I')
                score += 0.28;
            if (c == 'N')
                score += 0.28;
            if (c == 'S')
                score += 0.24;
            if (c == 'R')
                score += 0.24;
            if (c == 'H')
                score += 0.24;
        }

        return score;
    }

    private static ArrayList<Character> getMostFrequentLetters(String word) {
        HashMap<Character, Integer> hashMap = new HashMap<>();
        for (int i = 0; i < word.length(); i++) {
            if (!hashMap.containsKey(word.charAt(i))) {
                hashMap.put(word.charAt(i), 1);
            } else {
                hashMap.put(word.charAt(i), hashMap.get(word.charAt(i)) + 1);
            }
        }

        // Get highest frequency value
        int max = 0;

        Set set = hashMap.entrySet();

        for (Object aSet : set) {
            Map.Entry me = (Map.Entry) aSet;
            if (max < (int)me.getValue()) {
                max = (int)me.getValue();
            }
        }

        ArrayList<Character> frequentCharacters = new ArrayList<>();
        for (Object aSet : set) {
            Map.Entry me = (Map.Entry) aSet;
            if (max == (int)me.getValue()) {
                frequentCharacters.add( (Character)me.getKey());
            }
        }

        return frequentCharacters;
    }

    private static void display(int count, String decryptedText, char[][] key, float score, PrintWriter writer) {

        System.out.println("##########################################################################################################");
        writer.println("##########################################################################################################");

        System.out.println("Attempt #" + count + '\n' + "Score: " + score + '\n'  + decryptedText);
        writer.println("Attempt #" + count + '\n' + "Score: " + score + '\n' + decryptedText);

        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                System.out.print(key[i][j] + " ");
                writer.print(key[i][j] + " ");
            }
            System.out.print('\n');
            writer.print('\n');
        }
    }

}
