import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;

public class Fix1A {
    public static void main(String[] args) {
        BufferedReader reader;
        try {
            reader = new BufferedReader(new FileReader(args[0]));
            String line;
            String s = "";
            while ((line = reader.readLine()) != null) {
                if (line.length() <= 1)
                    continue;
                s += line + "\r\n";
            }
            System.out.print(s.trim());
            reader.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}