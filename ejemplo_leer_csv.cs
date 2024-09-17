using System;
using System.IO;

class Program
{
  static void Main(string[] args)
  {
    // Reemplaza con la ruta de tu archivo CSV
    string filePath = "C:\\Users\\matis\\OneDrive\\projects\\prog2_clases\\assets\\localidades-29-7nm.csv";

    try
    {
      using (StreamReader reader = new StreamReader(filePath))
      {
        string line;
        // Leer y mostrar cada línea del archivo CSV
        while ((line = reader.ReadLine()) != null)
        {
          // Dividir la línea por comas (asumiendo que está separado por comas)
          string[] values = line.Split(',');

          // Mostrar los valores en consola
          Console.WriteLine("Ciudad: " + values[3] + ", Departamento: " + values[2]);
        }
      }
    }
    catch (FileNotFoundException ex)
    {
      Console.WriteLine("Error: El archivo no fue encontrado.");
    }
    catch (Exception ex)
    {
      Console.WriteLine("Error: " + ex.Message);
    }
  }
}