pipeline {
    agent any

    stages {
        stage('Preparation') {
            steps {
                echo 'Realizando preparativos...'
                sh 'echo "Clonando repositorio..."'
                sh 'echo "Instalando dependencias..."'
            }
        }

        stage('Build') {
            steps {
                echo 'Iniciando la construcción...'
                sh 'echo "Compilando código..."'
                sh 'echo "Empaquetando artefactos..."'
            }
        }

        stage('Test') {
            steps {
                echo 'Iniciando pruebas...'
                sh 'echo "Ejecutando pruebas unitarias..."'
                sh 'echo "Generando informe de cobertura..."'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Iniciando despliegue...'
                sh 'echo "Desplegando en servidor de pruebas..."'
                sh 'echo "Verificando integridad de despliegue..."'
                sh 'echo "Notificando resultado del despliegue..."'
            }
        }
    }

    post {
        always {
            echo 'Finalizando pipeline...'
        }
    }
}
