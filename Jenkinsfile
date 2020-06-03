pipeline {
  agent any
  stages {
    stage('Setup Python Environment') {
      steps {
        sh 'make setup && ls -lamo ~/.capstone/bin/activate' 
        sh '. ~/.capstone/bin/activate && which python && python -V && make install'
      }
    }
    stage('Lint Python') {
      steps {
        sh 'pwd && ls'
        sh 'pylint --disable=R,C,W1203,W1309 ./App/app.py'
      }
    }
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e ./App/templates/*.html'
      }
    }

  }
}