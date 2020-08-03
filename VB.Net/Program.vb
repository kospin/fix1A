Imports System

Module Program
    Sub Main(args As String())
        On Error GoTo onerror
        If args.Count < 1 Then
            End
        End If
        Dim data = IO.File.ReadAllBytes(args(0))
        If data.Last = Str(26) Then
            Dim fix(data.Count - 1 - 3) As Byte
            For i = LBound(data) To UBound(data) - 3
                fix(i) = data(i)
            Next
            IO.File.WriteAllBytes(args(0), fix)
            Console.WriteLine("Ok")
        End If
onok:
        End
onerror:
        Console.WriteLine("Error")
    End Sub
End Module
