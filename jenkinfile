pipeline{
    agent any
    stages{
        stage('scm checkout'){
            steps{
                git branch: 'InfraAws', url: 'https://github.com/itspurnima/testinfra.git'
            }
        }
        stage('terraform init and plan'){
            steps{
                withAWS(credentials: 'jenkin-test-user', region: 'us-east-1') {
                bat 'terraform init'
                bat 'terraform plan'
                bat 'terraform apply -input=false -auto-approve'
            }
            }
        }
        stage('terraform destroy'){
            steps{
                withAWS(credentials: 'jenkin-test-user', region: 'us-east-1') {
                bat 'terraform destroy -auto-approve'
                } 
            }
        }
    }
}