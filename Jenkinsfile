pipeline {
  environment {
    registry = "645851037944.dkr.ecr.us-west-2.amazonaws.com/cdoe-capstone-proj"
    registryCredential = 'ecr:us-west-2:aws-ecr-creds'
  }
  agent any
      docker {
        args '--build-arg CONT_IMG_VAR=${env.BUILD_ID}'
    }
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
          docker.withRegistry("https://" + registry, registryCredential) {
            def capstoneImage = docker.build registry + ":${env.BUILD_ID}"
            capstoneImage.push()
            capstoneImage.push('latest')
          }
        }
      }
    }
    stage('Deploy Image To K8s') {
      steps{
        withAWS(credentials: 'aws-creds', region: 'us-west-2') {
          sh """
            aws eks --region us-west-2 update-kubeconfig --name capstone-eks-cluster
            kubectl get deployments
            kubectl get pods
            kubectl get service
            kubectl set image deployments/capstone-web cdoe-capstone-proj=645851037944.dkr.ecr.us-west-2.amazonaws.com/cdoe-capstone-proj:${env.BUILD_ID}
          """
        }
        /*
        steps{    
          sh """
            kubectl --kubeconfig /home/ubuntu/.kube/config set image deployments/capstone-web cdoe-capstone-proj=645851037944.dkr.ecr.us-west-2.amazonaws.com/cdoe-capstone-proj:${env.BUILD_ID}
 
 
           ok=$(curl http://a985ec492507f4144aefa97d52ec8523-1677730818.us-west-2.elb.amazonaws.com/healthcheck)
           if [ ${ok} != "ok" ]; then kubectl rollout undo capstone-web fi

          """
        }
        */
      }
    }
  }
}