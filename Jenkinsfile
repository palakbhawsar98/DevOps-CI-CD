pipeline {
    agent any
 
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'main', url: 'https://github.com/palakbhawsar98/JavaWebApp'
             
          }
        }
  stage('Maven Build') {
           steps {
             
                sh 'mvn clean install'             
          }
      
         post {
                success {
                    archiveArtifacts artifacts: '**/target/*.jar'
                }
            }
        }
  stage('Maven Test') {
           steps {
             
                sh 'mvn test'             
          }
        }

   stage('Code Analysis') {
          
		  environment {
             scannerHome = tool 'sonar4.8'
          }

   steps {
            withSonarQubeEnv('sonar') {
               sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=web-services \
                   -Dsonar.projectName=web-services \
                   -Dsonar.projectVersion=1.0 \
                   -Dsonar.sources=src/ \
                   -Dsonar.java.binaries=target/ \
                 '''
            }

  
          }
	}
         
    }
 }
