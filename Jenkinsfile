pipeline {
    agent none

    options {
        skipDefaultCheckout()
    }

    stages {
        stage('Grab the code') {
            agent any

            steps {
                checkout scm
            }
        }

        stage('Build the site') {
            agent any
            steps {
                sh 'hugo'
            }
        }

        stage('Deploy to Stage?') {
            agent none

            steps {
                script {
                    def varName = input message: 'What is your name?', parameters: [string(defaultValue: '', description: '', name: 'Answer', trim: false)]
                    env.NAME = "${varName}"
                }
            }
        }

        stage('Deploy to stage') {
            agent any
            environment {
                SUPER_SECRET = 'Foo'
            }

            steps {
                echo "Hi ${env.NAME}"
                echo "The Password is: ${SUPER_SECRET}"
            }
        }
    }
}