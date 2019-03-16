pipeline {
    agent none

   options {
        skipDefaultCheckout()
    }

    stages {
        stage('Grab Code') {
            agent { label 'docker' }

            steps {
                checkout scm
            }
        }

        stage('Build the Site') {
            agent { dockerfile true }

            steps {
                sh 'hugo'
            }
        }

        stage('Ready to Deploy?') {
            agent none

            steps {
                input 'Deploy the site?'
            }
        }

        stage('Deploy to Prod') {
            agent { dockerfile true }
            environment {
                HOST_IP = '138.68.248.172'
                SSH_KEY = credentials('webserver-ssh-key')
            }

            steps {
                writeFile(file: 'webserver.key', text: "${env.SSH_KEY}")
                sh 'chmod 600 webserver.key'
                sh "rsync -avhzP ./public/ -e 'ssh -o StrictHostKeyChecking=no' -e 'ssh -i webserver.key' sammy@${env.HOST_IP}:/path/to/web/root/"
                sh 'rm webserver.key'
            }
        }
    }
}