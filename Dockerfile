ARG SDK_VERSION_TAG
FROM microsoft/dotnet:${SDK_VERSION_TAG}

LABEL maintainer="estafette.io" \
      description="The estafette-extension-dotnet component is an Estafette extension to build and publish .NET Core applications and libraries."

RUN apt-get update && apt-get install -y openjdk-8-jre \
    && dotnet tool install --global --version 4.7.1 dotnet-sonarscanner

ENV PATH="$PATH:/root/.dotnet/tools" \
    ESTAFETTE_LOG_FORMAT="console"

COPY estafette-extension-dotnet /

ENTRYPOINT ["/estafette-extension-dotnet"]