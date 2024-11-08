# Usa la imagen de .NET SDK para compilar y construir la aplicación
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
 
# Establece el directorio de trabajo en el contenedor
WORKDIR /src
 
# Copia los archivos del proyecto al contenedor
COPY . .
 
# Restaura las dependencias del proyecto
RUN dotnet restore Tarea1C#.sln
 
# Compila el proyecto
RUN dotnet build Tarea1C#.sln -c Release -o /app/build
 
# Publica la aplicación
RUN dotnet publish Tarea1C#.sln -c Release -o /app/publish
 
# Cambia a una imagen runtime de .NET para ejecutar la aplicación
FROM mcr.microsoft.com/dotnet/runtime:8.0
 
# Establece el directorio de trabajo en el contenedor
WORKDIR /app
 
# Copia los archivos compilados desde la fase de construcción
COPY --from=build /app/publish .
 
# Comando para ejecutar la aplicación
CMD ["dotnet", "Tarea1C#.dll"]