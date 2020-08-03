using System;
using System.IO;

namespace myApp
{

    class Program
    {
        static void Main(string[] args)
        {
            // Console.WriteLine("Hello World!");
            if (args.Length >= 1)
                try
                {
                    byte[] data = File.ReadAllBytes(args[0]);
                    if (data[data.Length - 1] == 26)
                    {
                        byte[] fix = new byte[data.Length - 3];
                        for (int i = 0; i < data.Length - 3; i++)
                            fix[i] = data[i];
                        File.WriteAllBytes(args[0], fix);
                        Console.WriteLine("Ok");
                    }
                }
                catch (Exception)
                {
                    Console.WriteLine("Error");
                }
        }
    }
}
