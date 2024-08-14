#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
RUN mkdir -p /usr/local/cdl
RUN mkdir -p /usr/local/pdf
RUN chown app /usr/local/cdl
RUN chown app /usr/local/pdf
USER app
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["src/pesctranscriptconverter-api/PescTranscriptConverter.Api/PescTranscriptConverter.Api.csproj", "PescTranscriptConverter.Api/"]
COPY ["src/pesctranscriptconverter-api/PescTranscriptConverter.ServiceDefaults/PescTranscriptConverter.ServiceDefaults.csproj", "PescTranscriptConverter.ServiceDefaults/"]
RUN dotnet restore "./PescTranscriptConverter.Api/PescTranscriptConverter.Api.csproj"
COPY ./src/pesctranscriptconverter-api/ .
WORKDIR "/src/PescTranscriptConverter.Api"
RUN dotnet build "./PescTranscriptConverter.Api.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./PescTranscriptConverter.Api.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY ["./assets", "."]
COPY --from=publish /app/publish .
USER root
RUN chown -R app /app/cdl
RUN chown -R app /app/pdf
USER app
ENTRYPOINT ["dotnet", "PescTranscriptConverter.Api.dll"]
