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
                success {
                    archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
                }
            }
        }

        stage('Deploy - Staging') {
            steps {
                sh './deploy.sh staging'
                sh './smoke_test.sh'
            }
        }

        stage('Ask to proceed') {
            steps {
                input 'Would you like to deploy to production?'
            }
        }

        stage('Deploy - Production') {
            steps {
                sh './deploy.sh prod'
            }
        }
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