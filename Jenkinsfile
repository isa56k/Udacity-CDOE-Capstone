pipeline {
     agent any
     stages {
         // Check linting is good
         stage('Lint Python') {
              steps {
                  sh '--disable=R,C,W1203,W1309 /App/app.py'
              }         
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e /App/templates/*.html'
              }
         }
        // Upload to AWS
        /*
         stage('Upload to AWS') {
              steps {
                  withAWS(region:'us-west-2',credentials:'aws-static-up') {
                  sh 'echo "Uploading content with AWS creds to S3"'
                      s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'index.html', bucket:'cdoe-proj-aws-static')
                  }
              }
         */
         }
         
     }  
}
