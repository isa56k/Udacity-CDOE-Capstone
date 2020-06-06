pipeline {
  environment {
    registry = "645851037944.dkr.ecr.us-west-2.amazonaws.com/cdoe-capstone-proj"
    registryCredential = 'AWSECR'
  }
  agent any
  stages {
    stage('Setup Python Environment') {
      steps {
        sh '''
          cd ./App/
          pwd && ls -lamo
          make setup 
          . ~/.capstone/bin/activate
          make install
        '''
      }
    }
    stage('Lint Python App') {
      steps {
        sh '''
          . ~/.capstone/bin/activate 
          pylint --disable=R,C,W1203,W1309 ./App/app.py
        '''  
      }
    }
    stage('Lint HTML App') {
      steps {
        sh 'tidy -q -e ./App/templates/*.html'
      }
    }
    stage('Build Docker Image'){
      steps{
        script{
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{    
        script {
          docker.withRegistry("https://645851037944.dkr.ecr.us-west-2.amazonaws.com/cdoe-capstone-proj", "ecr:us-west-2:aws-ecr-creds" ) {
            docker.image("645851037944.dkr.ecr.us-west-2.amazonaws.com/cdoe-capstone-proj").push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}