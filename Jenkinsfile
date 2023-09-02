pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID=credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY=credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage ("stage 1"){
            steps {
                echo "This is stage one, where we download base_infrastructure from git"
                sh '''
                   mkdir jenkins
                   cd jenkins
                   git clone https://github.com/olaoyeleye/hr-management.git

            
                  
                   '''
            }
        }
      
      
      