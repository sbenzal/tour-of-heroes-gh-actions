pipeline {
    agent any 

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                // Aquí puedes poner los comandos para construir tu aplicación.
                // Por ejemplo, si estás usando Maven para una aplicación Java, podrías usar 'sh 'mvn compile''
                sh 'dotnet build'              
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                // Aquí puedes poner los comandos para probar tu aplicación.
                // Por ejemplo, si estás usando Maven para una aplicación Java, podrías usar 'sh 'mvn test''
                sh 'dotnet test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying..'
                // Aquí puedes poner los comandos para desplegar tu aplicación.
                // Esto dependerá mucho de tu entorno de despliegue.
                sh 'dotnet publish -c Release -o ./publish'
            }
        }
    }
}