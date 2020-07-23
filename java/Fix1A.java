
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Fix1A {
    public static void main(String[] args) {
        try {
            BufferedReader reader = new BufferedReader(new FileReader(args[0]));
            String text = new String(Files.readAllBytes(Paths.get(args[0])));
            System.out.print(text.trim());
            reader.close();
        } catch (final IOException e) {
            e.printStackTrace();
        }
    }
}