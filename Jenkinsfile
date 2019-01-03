pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }

    stages {
        stage('Initial commands') {
            steps {
                sh '''
                    pwd
                '''
            }
        }

        stage('Environment') {
            steps {
                echo "ENVIRONMENT VARS: #{env}"
            }
        }

        stage('Build') {
            steps {
                retry(3) {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }

        //stage('Publish') {}
        //stage('Dockerize') {}
        //stage('Deploy') {}
    }
    post {
        always {
            echo 'The results are in:'
        }
        success {
            echo 'All steps completed without errors'
        }
        failure {
            echo 'Something went wrong! See the logs for details.'
        }
        unstable {
            echo 'Unstable'
        }
        changed {
            echo 'The state of this pipeline has changed...'
        }
    }
}