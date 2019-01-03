/*
pipeline {
    agent { docker { image 'maven:3.3.3' } }
    stages {
        stage('build') {
            steps {
                sh 'mvn --version'
            }
        }
    }
}
*/

pipeline {
    agent any
    stages {
        stage('Command Line') {
            steps {
                sh '''
                    whoami
                    pwd
                '''
            }
        }

        stage('Build') {
            steps {
                retry(3) {
                    sh 'echo 1'
                }
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