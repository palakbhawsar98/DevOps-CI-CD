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
  
     stage('Build Docker Image') {
         
          environment {
             dockerHome = tool 'docker'
          }
           steps {
              
                sh 'docker build -t javawebapp:latest .' 
                sh 'docker tag javawebapp palakbhawsar/javawebapp:latest'     
          }
        }
     
  stage('Push image to DockerHub') {
          
            steps {
        withDockerRegistry([ credentialsId: "docker-hub-cred", url: "" ]) {
          sh  'docker push palakbhawsar/javawebapp:latest'
        }
                  
          }
        }
      
      
    }
 }
