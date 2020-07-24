import java.nio.file.Files
import java.nio.file.Paths


public fun main(args: Array<String>){
    val f =Files.readAllBytes(Paths.get(args[0]))
    if(f.last().toInt()==26) {
        val g = f.copyOfRange(0, f.lastIndex - 2)
        Files.write(Paths.get(args[0]),g)
    }
}