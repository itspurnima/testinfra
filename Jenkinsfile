pipeline{
    agent any
    stages{
        stage('scm checkout'){
            steps{
            script{
                   currentBuild.displayName="php"
                }
                echo "Getting the code from git"
                git branch: 'test', url: 'https://github.com/itspurnima/testinfra.git'
            }
        }
            stage('create docker image'){
                steps{
                bat 'docker build -t sampletest .'
            }
            }
            stage('push to hub'){
                steps{
                    withCredentials([string(credentialsId: 'Dockerhub', variable: 'Dockerhubpwd1')]) {
                   bat "docker login -u purnimakalisetty -p ${Dockerhubpwd1}" 
                  bat 'docker tag sampletest purnimakalisetty/test_php:firstimage'
                   bat 'docker push purnimakalisetty/test_php:firstimage'
                }
            }
        }
    }
}
