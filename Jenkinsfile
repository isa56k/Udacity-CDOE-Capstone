pipeline {
  agent any
  stages {
    stage('Lint Python') {
      steps {
        sh 'pylint --disable=R,C,W1203,W1309 /App/app.py'
      }
    }

    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e /App/templates/*.html'
      }
    }

  }
}