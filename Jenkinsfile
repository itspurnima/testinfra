pipeline{
    agent any
    environment {
		
		DEV_IP = "3.86.190.108"
	}
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
                   withCredentials([string(credentialsId: 'dockerPwd', variable: 'dockerHubpwd')]) {
                   sh "docker login -u purnimakalisetty -p ${dockerHubpwd}" 
                  sh 'docker tag sampletest purnimakalisetty/test_php:firstimage'
                   sh 'docker push purnimakalisetty/test_php:firstimage'
                }
                    
            }
        }
        stage('Remove Old Containers'){
		steps{
			script{
            sshagent(['ec2-user']) {
          try{
                def sshCmd = "ssh -o StrictHostKeyChecking=no ec2-user@${DEV_IP}"
                 def dockerRM = 'docker rm -f /test_php'
                sh "${sshCmd} ${dockerRM}"
            }catch(error){}
	    }
			}
           }
       }
         stage('Deploy to k8s'){
               steps{
                   sshagent(['kops-machine']) {
                         
                          sh "ssh -o StrictHostKeyChecking=no deployment.yml ec2-user@${DEV_IP}:/home/ec2-user/"
                   script{
                       try{
                           sh "ssh ec2-user@${DEV_IP} kubectl apply -f ."
                       }catch(error){
                          sh "ssh ec2-user@${DEV_IP} kubectl create -f ."  
                       }                                        
              }
                   }
          }
           }
        }
    }
