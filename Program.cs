
using System;

class Tarea1C
{
    static void Main()
    {
        // Solicita el radio del círculo al usuario
        Console.Write("Introduce el radio del círculo: ");
        double radio = double.Parse(Console.ReadLine());

        // Calcula el área del círculo
        double area = Math.PI * Math.Pow(radio, 2);

        // Muestra el resultado
        Console.WriteLine("El área del círculo es: " + area);
    }
}
