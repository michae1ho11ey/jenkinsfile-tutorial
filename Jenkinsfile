pipeline {
    agent none

   options {
        skipDefaultCheckout()
    }

    stages {
        stage('Grab Code') {
            agent any

            steps {
                checkout scm
            }
        }

        stage('Build the Site') {
            agent any

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
            agent any
            environment {
                WEB_HOST_IP = '165.227.8.12'
                WEB_HOST_USER = 'webmaster'
                WEB_HOST_PATH = '/var/www/html'
                SSH_KEY = credentials('webserver-ssh-key')
            }

            steps {
                writeFile(file: 'webserver.key', text: "${env.SSH_KEY}")
                sh 'chmod 600 webserver.key'
                sh "rsync -avhzP ./public/ -e \'ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null\' -e \'ssh -i webserver.key\' ${WEB_HOST_USER}@${env.WEB_HOST_IP}:${WEB_HOST_PATH}/"
                sh 'rm webserver.key'
            }
        }
    }
}
