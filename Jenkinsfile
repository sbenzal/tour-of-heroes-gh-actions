pipeline {
    agent any 

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out..'
                // Aquí puedes poner los comandos para obtener el código fuente de tu aplicación.
                // Por ejemplo, si estás usando Git, podrías usar 'git clone
                checkout scm
            }
        }
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
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying..'
                // Aquí puedes poner los comandos para desplegar tu aplicación.
                // Esto dependerá mucho de tu entorno de despliegue.
            }
        }
    }
}