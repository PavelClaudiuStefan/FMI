import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Scanner;

public class Ex1 {

    public static void main(String[] args) {

        String encryptedText = null;
        int keywordLength = 0;

        boolean isValid;

        Scanner input = new Scanner(System.in);

        // Get valid text from input
        // is valid if text length <= 50
        isValid = false;
        while(!isValid) {
            System.out.println("Text:");
            encryptedText = input.nextLine();
            if (encryptedText.length() <= 50)
                isValid = true;
            else
                System.out.println("Text length is not valid\n");
        }

        // Get valid keyword length from input
        // is valid if value <= text length
        isValid = false;
        while(!isValid) {
            System.out.println("Keyword length:");
            keywordLength = input.nextInt();
            if (keywordLength <= encryptedText.length())
                isValid = true;
            else
                System.out.println("Number is not valid\n");
        }

        input.close();

        // a
        // Return if text length is odd
        if (encryptedText.length() %2 != 0) {
            System.out.println("!!!Text length is not even (" + encryptedText.length() + ") !!!");
            return;
        }

        // Return if text contains unknwown symbols
        for (int i = 0; i < encryptedText.length(); i++) {
            if (!Playfair.isValidSymbol(encryptedText.charAt(i) )) {
                System.out.println("!!!Text contains unknown symbols!!!");
                return;
            }
        }

        Playfair.bruteForceDecrypt(encryptedText, keywordLength);

        ArrayList<Integer> elements = new ArrayList<>();
        elements.add(1);
        elements.add(2);
        elements.add(3);
        elements.add(4);

        int[][] ints = {{1,2}, {3,4}};

        Collections.swap(elements, 1, 2);

        Iterator<Integer> iterator = elements.iterator();

        int index = 0;
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 2; j++) {
                if (iterator.hasNext())
                    ints[i][j] = iterator.next();
            }
        }
    }

}
