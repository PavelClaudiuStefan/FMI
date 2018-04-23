import java.io.*;
import java.util.Objects;

public class Ex3 {

    public static void main(String[] args) {

        String key = "jgLiByHkPSnyRwLS";

        String fileName = "info_banci.txt";
        String account1 = null;
        String account2 = null;
        String amount = null;
        String currency = null;

        // A
        try {
            FileReader fileReader = new FileReader(fileName);
            BufferedReader bufferedReader = new BufferedReader(fileReader);

            account1 = bufferedReader.readLine();
            account2 = bufferedReader.readLine();
            amount = bufferedReader.readLine();
            currency = bufferedReader.readLine();

            bufferedReader.close();
        }
        catch(FileNotFoundException ex) {
            System.out.println("Unable to open file '" + fileName + "'");
        }
        catch(IOException ex) {
            System.out.println("Error reading file '" + fileName + "'");
        }

        // B
        String bank1 = getBank(account1);
        String bank2 = getBank(account2);

        String message = bank1 + " " + account1 + " " + bank2 + " " + account2 + " " + amount + " " + currency;
        String encryptedMesssage = Aes.encrypt(message, key);

        try (PrintWriter printWriter = new PrintWriter("encrypted_message.txt", "UTF-8")) {

            printWriter.println(encryptedMesssage);

        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println(encryptedMesssage);

        String bank3 = "ING";
        String account3 = "RO04INGB1234567813572468";
        String message2 = bank1 + " " + account1 + " " + bank3 + " " + account3 + " " + amount + " " + currency;
        String encryptedMesssage2 = Aes.encrypt(message2, key);
        System.out.println(encryptedMesssage2);

    }

    private static String getBank(String iban) {
        String bank;
        String subStr = iban.substring(4, 9);

        if (Objects.equals(subStr, "BTRL"))
            bank = "Transilvania";
        else if (Objects.equals(subStr, "INGB"))
            bank = "ING";
        else bank = null;

        return bank;
    }

}
