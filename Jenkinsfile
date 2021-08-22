pipeline{
    agent any
    stages{
        stage('scm checkout'){
            steps{
            script{
                   currentBuild.displayName="php"
                }
                echo "Getting the code from git"
                git branch: 'main', url: 'https://github.com/itspurnima/testinfra.git'
            }
        }
            stage('create docker image'){
                steps{
                sh 'docker build -t sampletest .'
            }
            }
        stage('push to hub'){
                steps{
                    
                    
                    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                   sh "docker login -u purnimakalisetty -p ${dockerhub}" 
                  sh 'docker tag sampletest purnimakalisetty/test_php:firstimage'
                   sh 'docker push purnimakalisetty/test_php:firstimage'
                }
                    
            }
        }
        stage('Run Container on Dev Server'){
               steps{
                   script{
                      def dockerRun = 'docker run -p 8080:8080 -d --name test_php purnimakalisetty/test_php:firstimage'
                      sshagent(['sshagent']) {
                          sh "apt-get update && apt-get install ssh -y"
                       sh "ssh -o StrictHostKeyChecking=no ec2-user@18.205.160.222 ${dockerRun}"
              }
                   }
          }
           }
        }
    }
