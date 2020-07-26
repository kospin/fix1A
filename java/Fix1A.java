
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Fix1A {
    public static void main(String[] args) {
        try {
            String text = new String(Files.readAllBytes(Paths.get(args[0])));
            if (text.getBytes()[text.getBytes().length-1]==26)
                Files.write(Paths.get(args[0]),text.trim().getBytes());
        } catch (final IOException e) {
            e.printStackTrace();
        }
    }
}